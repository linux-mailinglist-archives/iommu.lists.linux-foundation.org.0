Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E38314BB6
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 10:36:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A033B85DC1;
	Tue,  9 Feb 2021 09:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pfOE9bp6JuOD; Tue,  9 Feb 2021 09:36:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 71A8D8502A;
	Tue,  9 Feb 2021 09:36:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 542CFC013A;
	Tue,  9 Feb 2021 09:36:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7CB9C013A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 09:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 91B5A847F8
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 09:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VyfYBOuPruYh for <iommu@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 09:36:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1691884771
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 09:36:46 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3634268B02; Tue,  9 Feb 2021 10:36:42 +0100 (CET)
Date: Tue, 9 Feb 2021 10:36:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: DMA direct mapping fix for 5.4 and earlier stable branches
Message-ID: <20210209093642.GA1006@lst.de>
References: <CAFA6WYNazCmYN20irLdNV+2vcv5dqR+grvaY-FA7q2WOBMs__g@mail.gmail.com>
 <YCIym62vHfbG+dWf@kroah.com>
 <CAFA6WYM+xJ0YDKenWFPMHrTz4gLWatnog84wyk31Xy2dTiT2RA@mail.gmail.com>
 <YCJCDZGa1Dhqv6Ni@kroah.com>
 <27bbe35deacb4ca49f31307f4ed551b5@SOC-EX02V.e01.socionext.com>
 <YCJUgKDNVjJ4dUqM@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCJUgKDNVjJ4dUqM@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: sumit.garg@linaro.org, daniel.thompson@linaro.org,
 obayashi.yoshimasa@socionext.com, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 robin.murphy@arm.com, hch@lst.de
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

On Tue, Feb 09, 2021 at 10:23:12AM +0100, Greg KH wrote:
> >   From the view point of ZeroCopy using DMABUF, is 5.4 not 
> > mature enough, and is 5.10 enough mature ?
> >   This is the most important point for judging migration.
> 
> How do you judge "mature"?
> 
> And again, if a feature isn't present in a specific kernel version, why
> would you think that it would be a viable solution for you to use?

I'm pretty sure dma_get_sgtable has been around much longer and was
supposed to work, but only really did work properly for arm32, and
for platforms with coherent DMA.  I bet he is using non-coherent arm64,
and it would be broken for other drivers there as well if people did
test them, which they apparently so far did not.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
