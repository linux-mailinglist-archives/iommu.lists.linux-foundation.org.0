Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EC9138368
	for <lists.iommu@lfdr.de>; Sat, 11 Jan 2020 21:02:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9450C2034B;
	Sat, 11 Jan 2020 20:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQzPlcBB5leC; Sat, 11 Jan 2020 20:02:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DE65C2002F;
	Sat, 11 Jan 2020 20:02:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE8C0C0881;
	Sat, 11 Jan 2020 20:02:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5957FC0881
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jan 2020 20:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4199A85FED
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jan 2020 20:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kFrn4UvugOZk for <iommu@lists.linux-foundation.org>;
 Sat, 11 Jan 2020 20:02:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A8B7F85CA1
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jan 2020 20:02:02 +0000 (UTC)
Received: from localhost (unknown [62.119.166.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3066A20866;
 Sat, 11 Jan 2020 20:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578772922;
 bh=4bxlJS8vU/MMH+Ybyi3LMPzmFH6dAF8uh/1PGTdl3xA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S9eCIiQmHgrpL7kJjjR0uW8UKxu9gv1wYz0w8LRH6KFUekcDJf56aMKwU1jPaU3x3
 YuK6X5QP/6MiL3LOSO8uSOf5djvapdHtKotypUbvoPY8c1xKgmrCuuSd2I2WMrCDxV
 tia3Y7mfUL6e33emaKXl/gAS4XhRzh32P3AhDuKs=
Date: Sat, 11 Jan 2020 20:40:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v11 2/4] uacce: add uacce driver
Message-ID: <20200111194006.GD435222@kroah.com>
References: <1578710919-12141-1-git-send-email-zhangfei.gao@linaro.org>
 <1578710919-12141-3-git-send-email-zhangfei.gao@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578710919-12141-3-git-send-email-zhangfei.gao@linaro.org>
Cc: jean-philippe <jean-philippe@linaro.org>, dave.jiang@intel.com,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 francois.ozog@linaro.org, linux-accelerators@lists.ozlabs.org,
 ilias.apalodimas@linaro.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>,
 grant.likely@arm.com, "haojian . zhuang" <haojian.zhuang@linaro.org>,
 linux-crypto@vger.kernel.org, Kenneth Lee <liguozhu@hisilicon.com>,
 guodong.xu@linaro.org, kenneth-lee-2012@foxmail.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Sat, Jan 11, 2020 at 10:48:37AM +0800, Zhangfei Gao wrote:
> +static int uacce_fops_open(struct inode *inode, struct file *filep)
> +{
> +	struct uacce_mm *uacce_mm = NULL;
> +	struct uacce_device *uacce;
> +	struct uacce_queue *q;
> +	int ret = 0;
> +
> +	uacce = xa_load(&uacce_xa, iminor(inode));
> +	if (!uacce)
> +		return -ENODEV;
> +
> +	if (!try_module_get(uacce->parent->driver->owner))
> +		return -ENODEV;

Why are you trying to grab the module reference of the parent device?
Why is that needed and what is that going to help with here?

This shouldn't be needed as the module reference of the owner of the
fileops for this module is incremented, and the "parent" module depends
on this module, so how could it be unloaded without this code being
unloaded?

Yes, if you build this code into the kernel and the "parent" driver is a
module, then you will not have a reference, but when you remove that
parent driver the device will be removed as it has to be unregistered
before that parent driver can be removed from the system, right?

Or what am I missing here?

> +static void uacce_release(struct device *dev)
> +{
> +	struct uacce_device *uacce = to_uacce_device(dev);
> +
> +	kfree(uacce);
> +	uacce = NULL;

That line didn't do anything :)

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
