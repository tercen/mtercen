#[macro_use]
extern crate rustr;

pub mod export;

pub use rustr::*;

// #[rustr_export]
pub fn acast_vec(ri: IntVec, ci: IntVec, values: NumVec, nrow: usize, ncol: usize, fill: f64) -> RResult<NumVec> {
    if ri.rsize() != values.rsize() || ci.rsize() != values.rsize() {
        return Err(RError::unknown("acast -- bad length".to_string()));
    }

    let len: usize = (ncol * nrow) as usize;
    let mut matrix = NumVec::alloc_matrix(ncol, nrow);

    unsafe {
        for i in 0..len {
            matrix.uset(i, fill);
        }
    }

    let mut count: Vec<u32> = vec![0; len];

    let nn = values.rsize() as usize;

    unsafe {
        for i in 0..nn {
            let r = ri.uat(i) as usize;
            let c = ci.uat(i) as usize;
            let ii = c * (nrow as usize) + r;
            if ii >= len {
                return Err(RError::unknown("acast -- bad index".to_string()));
            }
            count[ii] = count[ii] + 1;
            let v = matrix.uat(ii) + values.uat(i);
            matrix.uset(ii, v);
        }

        for ii in 0..len {
            if count[ii] > 0 {
                let v = (matrix.uat(ii) - fill) / (count[ii] as f64);
                matrix.uset(ii, v);
            }
        }
    }


    return Ok(matrix);
}
