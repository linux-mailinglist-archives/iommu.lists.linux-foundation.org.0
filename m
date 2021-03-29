Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F6934CF51
	for <lists.iommu@lfdr.de>; Mon, 29 Mar 2021 13:48:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B5683139;
	Mon, 29 Mar 2021 11:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POVJA6LMYJKZ; Mon, 29 Mar 2021 11:48:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B78E83118;
	Mon, 29 Mar 2021 11:48:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB9DFC000A;
	Mon, 29 Mar 2021 11:48:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD1D1C000A
 for <iommu@lists.linux-foundation.org>; Mon, 29 Mar 2021 11:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96EF483118
 for <iommu@lists.linux-foundation.org>; Mon, 29 Mar 2021 11:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ybAyb-7bKd7E for <iommu@lists.linux-foundation.org>;
 Mon, 29 Mar 2021 11:48:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1183282BD6
 for <iommu@lists.linux-foundation.org>; Mon, 29 Mar 2021 11:48:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7B6B6195B;
 Mon, 29 Mar 2021 11:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1617018522;
 bh=7bOjh2VBV6ORFq+hCMAwT1T3XPaqoe4QhuhPDGs1AAs=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=UWtdSj5jytB4yinCTIl3uubMK3m15sgaJtDCKH4UDmRTzMxypBr8y8V81cmTfFm0M
 srtX9TghLWGx+Ep76clREiLK59I/9LFZrkw/NAqR/q5/Bwjvxm3c5aV4hyPSPoQTJo
 xfqlBmY7r+HQbjNRQKB/IDAmJg0CoWggrzQOzLDE=
Date: Mon, 29 Mar 2021 13:48:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/30] DMA: Mundane typo fixes
Message-ID: <YGG+l1EfRuWp0J3A@kroah.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
 <20210329052910.GB26495@lst.de> <YGFrvwX8QngvwPbA@Gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGFrvwX8QngvwPbA@Gentoo>
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

On Mon, Mar 29, 2021 at 11:25:11AM +0530, Bhaskar Chowdhury wrote:
> On 07:29 Mon 29 Mar 2021, Christoph Hellwig wrote:
> > I really don't think these typo patchbomb are that useful.  I'm all
> > for fixing typos when working with a subsystem, but I'm not sure these
> > patchbombs help anything.
> > 
> I am sure you are holding the wrong end of the wand and grossly failing to
> understand.

Please stop statements like this, it is not helpful and is doing nothing
but ensure that your patches will not be looked at in the future.

> Anyway, I hope I give a heads up ...find "your way" to fix those damn
> thing...it's glaring....

There is no requirement that anyone accept patches that are sent to
them.  When you complain when receiving comments on them, that
shows you do not wish to work with others.

Sorry, but you are now on my local blacklist for a while, and I
encourage other maintainers to just ignore these patches as well.

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
