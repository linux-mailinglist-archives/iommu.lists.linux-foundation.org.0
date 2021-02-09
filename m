Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBAF314D35
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 11:40:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 618EB8725F;
	Tue,  9 Feb 2021 10:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kMKOP0adkC2K; Tue,  9 Feb 2021 10:40:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4EB3987253;
	Tue,  9 Feb 2021 10:40:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22273C013A;
	Tue,  9 Feb 2021 10:40:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1ED6BC013A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 10:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1AFFE85EBF
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 10:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHmnWfKo5dqf for <iommu@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 10:39:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CF32185E98
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 10:39:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4BC464E4B;
 Tue,  9 Feb 2021 10:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612867197;
 bh=/jh06s5G/k5IVhUW0yt0cXHDhlQpDXNonOEqGQ0F5qg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NvMFBEAJSBSoBgfeE00P1l46u1S3zR8ZgC92VkrGXNBZQuRkiv3FBf5/BWa3AU0l2
 +Bcp0x149qDPwTIkgv9CTtwbxFBMuydrVT7JTYBcT2SpShOevWsbynTFEld/q+rWL7
 +RbWKxPN1+fsK/BNEFqHZj5ruw1wX0KC4xxywqXU=
Date: Tue, 9 Feb 2021 11:39:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: obayashi.yoshimasa@socionext.com
Subject: Re: DMA direct mapping fix for 5.4 and earlier stable branches
Message-ID: <YCJmegLycZ5hnCUr@kroah.com>
References: <CAFA6WYNazCmYN20irLdNV+2vcv5dqR+grvaY-FA7q2WOBMs__g@mail.gmail.com>
 <YCIym62vHfbG+dWf@kroah.com>
 <CAFA6WYM+xJ0YDKenWFPMHrTz4gLWatnog84wyk31Xy2dTiT2RA@mail.gmail.com>
 <YCJCDZGa1Dhqv6Ni@kroah.com>
 <27bbe35deacb4ca49f31307f4ed551b5@SOC-EX02V.e01.socionext.com>
 <YCJUgKDNVjJ4dUqM@kroah.com>
 <ed485ad069af4d1481e3961db4a3e079@SOC-EX02V.e01.socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed485ad069af4d1481e3961db4a3e079@SOC-EX02V.e01.socionext.com>
Cc: sumit.garg@linaro.org, daniel.thompson@linaro.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com, hch@lst.de
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

On Tue, Feb 09, 2021 at 10:19:07AM +0000, obayashi.yoshimasa@socionext.com wrote:
> > How do you judge "mature"?
> 
>   My basic criteria are
> * Function is exist, but bug fix is necessary: "mature"
> * Function extension is necessary: "immature"
> 
> > And again, if a feature isn't present in a specific kernel version, why would you think that it would be
> > a viable solution for you to use?
> 
>   So, "a feature isn't present in a specific kernel version", 
> also means "immature" according to my criteria.

Great, please use the 5.10 or newer kernel release then.

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
