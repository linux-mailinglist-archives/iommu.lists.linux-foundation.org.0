Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D043EA530
	for <lists.iommu@lfdr.de>; Thu, 12 Aug 2021 15:09:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69CD5403DA;
	Thu, 12 Aug 2021 13:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EjhQNQy27tJs; Thu, 12 Aug 2021 13:09:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B43A4405C5;
	Thu, 12 Aug 2021 13:09:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93AA0C0022;
	Thu, 12 Aug 2021 13:09:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0374DC000E
 for <iommu@lists.linux-foundation.org>; Thu, 12 Aug 2021 13:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D97AC80BA1
 for <iommu@lists.linux-foundation.org>; Thu, 12 Aug 2021 13:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QNz14_8LLtXS for <iommu@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 13:09:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49F0E80B3E
 for <iommu@lists.linux-foundation.org>; Thu, 12 Aug 2021 13:09:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A09F268AFE; Thu, 12 Aug 2021 15:09:14 +0200 (CEST)
Date: Thu, 12 Aug 2021 15:09:14 +0200
From: 'Christoph Hellwig' <hch@lst.de>
To: Brian Cain <bcain@codeaurora.org>
Subject: Re: add support for the global coherent pool to the dma core
Message-ID: <20210812130914.GA22352@lst.de>
References: <20210712061704.4162464-1-hch@lst.de>
 <03d501d783c4$1d3f10e0$57bd32a0$@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03d501d783c4$1d3f10e0$57bd32a0$@codeaurora.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: 'Vladimir Murzin' <vladimir.murzin@arm.com>, "'Manning,
 Sid'" <sidneym@quicinc.com>, linux-hexagon@vger.kernel.org,
 'Russell King' <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, 'Dillon Min' <dillon.minfei@gmail.com>,
 'Christoph Hellwig' <hch@lst.de>, linux-arm-kernel@lists.infradead.org
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

On Wed, Jul 28, 2021 at 10:20:34AM -0500, Brian Cain wrote:
> > this series adds support for using the global coherent (aka uncached)
> > pool to the generic dma-direct code and then switches arm-nommu and
> > hexagon over to it, together with a bunch of cleanups.
> 
> Christoph,
> 
> Thanks for sending this -- I will take a look and give some feedback soon.

Any chance you'll get to this in the next days?  I'd love to merge this
series for the current merge window with a little time in linux-next.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
