Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2B9314933
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 07:58:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4193F8723B;
	Tue,  9 Feb 2021 06:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9jimpgiK1U3j; Tue,  9 Feb 2021 06:58:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 345718725F;
	Tue,  9 Feb 2021 06:58:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FF4DC1834;
	Tue,  9 Feb 2021 06:58:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D49F7C013A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 06:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BB97587241
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 06:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RgMGnPb8Xokz for <iommu@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 06:58:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3C1A38723B
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 06:58:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA80D64E9A;
 Tue,  9 Feb 2021 06:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612853919;
 bh=dpxVE0srNtqxA2P2gotaZ3bV8h2QUfJrlvUUTfe0l7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TXzbsFhDpAQgj9QwPWKvmB1zj6vFiKg4V4CTlVCZzGXPcxBW49yvO/txzd5T2Ii+w
 rtL1/wYnZETAmKBFTPqDlkEsOY+vxAe9mVCFLWZ97V8boxpU4loubPLrclacpCX3FY
 zrcJswcPX2TBjIjas307svqNOUapi81jMEm1i7hk=
Date: Tue, 9 Feb 2021 07:58:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sumit Garg <sumit.garg@linaro.org>
Subject: Re: DMA direct mapping fix for 5.4 and earlier stable branches
Message-ID: <YCIym62vHfbG+dWf@kroah.com>
References: <CAFA6WYNazCmYN20irLdNV+2vcv5dqR+grvaY-FA7q2WOBMs__g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYNazCmYN20irLdNV+2vcv5dqR+grvaY-FA7q2WOBMs__g@mail.gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, obayashi.yoshimasa@socionext.com,
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

On Tue, Feb 09, 2021 at 11:39:25AM +0530, Sumit Garg wrote:
> Hi Christoph, Greg,
> 
> Currently we are observing an incorrect address translation
> corresponding to DMA direct mapping methods on 5.4 stable kernel while
> sharing dmabuf from one device to another where both devices have
> their own coherent DMA memory pools.

What devices have this problem?  And why can't then just use 5.10 to
solve this issue as that problem has always been present for them,
right?

> I am able to root cause this issue which is caused by incorrect virt
> to phys translation for addresses belonging to vmalloc space using
> virt_to_page(). But while looking at the mainline kernel, this patch
> [1] changes address translation from virt->to->phys to dma->to->phys
> which fixes the issue observed on 5.4 stable kernel as well (minimal
> fix [2]).
> 
> So I would like to seek your suggestion for backport to stable kernels
> (5.4 or earlier) as to whether we should backport the complete
> mainline commit [1] or we should just apply the minimal fix [2]?

Whenever you try to create a "minimal" fix, 90% of the time it is wrong
and does not work and I end up having to deal with the mess.  What
prevents you from doing the real thing here?  Are the patches to big?

And again, why not just use 5.10 for this hardware?  What hardware is
it?

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
