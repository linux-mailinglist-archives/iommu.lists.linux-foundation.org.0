Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA77198DA3
	for <lists.iommu@lfdr.de>; Tue, 31 Mar 2020 09:56:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 532F82202C;
	Tue, 31 Mar 2020 07:56:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0np1P8LYveu; Tue, 31 Mar 2020 07:56:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B57A0204AC;
	Tue, 31 Mar 2020 07:56:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97915C1AE8;
	Tue, 31 Mar 2020 07:56:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0952C07FF
 for <iommu@lists.linux-foundation.org>; Tue, 31 Mar 2020 07:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CF7CC2202C
 for <iommu@lists.linux-foundation.org>; Tue, 31 Mar 2020 07:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fb3RgouGQ73J for <iommu@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 07:56:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 5DE06204AC
 for <iommu@lists.linux-foundation.org>; Tue, 31 Mar 2020 07:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tVPpfazcLCn+rGmQCgJ5zFx/4NhoiRWfcsMxHXRN42o=; b=FFlNEE/nlwmrb0Bytn4bR4slz5
 DIFgIBF6s9N6avl/FcU0oeGua2Y42YpqPuAivHRf8axXjj4MQSNcS3ne3ktFngaVB0i+Y3P2EUwWN
 V2KClLrxzs589LKw7aEYMNJlL09rtXUi2Po090dVhWbpr40z+H/Ag4UoKqPZBQxEDdURIwGcdqkk6
 q8EjEixndcchbHD/9Kf8bIMkWXZ03ArAmUaQ9rl7ja4K1T6yM4KUyunlW40SfWl7qiqV7rKKzYoU6
 S16zsX2EoWgfit+02B9oGzvIfX43eDvQEiiL6ljkaebIIMhilw8jrQyo0IyP6ftKMn+nzxHpAN/ey
 zvQoSzBg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jJBkh-0001Rp-Pp; Tue, 31 Mar 2020 07:56:03 +0000
Date: Tue, 31 Mar 2020 00:56:03 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v1 7/8] vfio/type1: Add VFIO_IOMMU_CACHE_INVALIDATE
Message-ID: <20200331075603.GB26583@infradead.org>
References: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
 <1584880325-10561-8-git-send-email-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584880325-10561-8-git-send-email-yi.l.liu@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, ashok.raj@intel.com,
 kvm@vger.kernel.org, jun.j.tian@intel.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, alex.williamson@redhat.com, yi.y.sun@intel.com,
 hao.wu@intel.com
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

> @@ -2629,6 +2638,46 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
>  		}
>  		kfree(gbind_data);
>  		return ret;
> +	} else if (cmd == VFIO_IOMMU_CACHE_INVALIDATE) {

Please refactor the spaghetti in this ioctl handler to use a switch
statement and a helper function per command before growing it even more.

> +		/* Get the version of struct iommu_cache_invalidate_info */
> +		if (copy_from_user(&version,
> +			(void __user *) (arg + minsz), sizeof(version)))
> +			return -EFAULT;
> +
> +		info_size = iommu_uapi_get_data_size(
> +					IOMMU_UAPI_CACHE_INVAL, version);
> +
> +		cache_info = kzalloc(info_size, GFP_KERNEL);
> +		if (!cache_info)
> +			return -ENOMEM;
> +
> +		if (copy_from_user(cache_info,
> +			(void __user *) (arg + minsz), info_size)) {

The user might have changed the version while you were allocating and
freeing the memory, introducing potentially exploitable racing
conditions.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
