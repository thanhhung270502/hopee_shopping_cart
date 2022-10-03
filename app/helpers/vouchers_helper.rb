module VouchersHelper
  $current_voucher_id

  def getVoucherId(voucher)
    $current_voucher_id = voucher.id
  end
  
  def current_voucher
    @current_voucher = Product.find($current_voucher_id);
  end

  def checkVoucher(voucher)
    if voucher.quantity <= 0
      return true
    end
    current_user.user_vouchers.each do |v|
      if v.voucher_id == voucher.id
        return true 
      end
    end
    return false
  end
end
