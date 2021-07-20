Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D44633CF62D
	for <lists.iommu@lfdr.de>; Tue, 20 Jul 2021 10:35:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8213783486;
	Tue, 20 Jul 2021 08:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jOqLava0HAAo; Tue, 20 Jul 2021 08:35:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id ACF8E8347D;
	Tue, 20 Jul 2021 08:35:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D43CC0022;
	Tue, 20 Jul 2021 08:35:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1919EC000E
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 08:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06775401AF
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 08:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ErLR39pAdLHm for <iommu@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 08:35:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCF1D400E5
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 08:35:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0A9B611EF;
 Tue, 20 Jul 2021 08:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626770136;
 bh=H9UUqQCl4PT+FM2yIrBMMn8pE51fXDZyIBexJTDkmw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jW27i5qWAcE2S1OfDzCaQcAPQ2nJlgysjINsqpVeyDgQmY4cOnWLEx0pRar08s5Vy
 mcB7ai7yBslk/xqFPZ9UnMiSgFmYDSJ5CzUjd5zotGoJtLaW5dOdBih0KpPrVqRKCP
 KmT1xO+6WaLjdGYzb3nKHJaMUo0IMS86yVdHpmFShKQAF+5fJp+avBPD0HebBYYMyR
 h15Y7Vwgey0HGnyhTWUAMe+0p6Wy53xgeNzSUQg3wufUlgLgAC4MI5/x5hQD2hgHbB
 VzkpURFMXitzMHI3G6VIGHXI2c9ICAufytvu/QjppMJtHETSzodN9J7wNDSJks20z8
 9UmQmPZZTa0Zw==
Date: Tue, 20 Jul 2021 09:35:31 +0100
From: Will Deacon <will@kernel.org>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH 5/5] swiotlb: Free tbl memory in swiotlb_exit()
Message-ID: <20210720083530.GA8089@willie-the-truck>
References: <20210719123054.6844-1-will@kernel.org>
 <20210719123054.6844-6-will@kernel.org>
 <CALiNf2_Ubi9cynH1Rjy-o87V3MyvdTazv5rO=sggNai0WJZ81g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALiNf2_Ubi9cynH1Rjy-o87V3MyvdTazv5rO=sggNai0WJZ81g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 lkml <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Guenter Roeck <linux@roeck-us.net>
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

On Tue, Jul 20, 2021 at 11:36:19AM +0800, Claire Chang wrote:
> On Mon, Jul 19, 2021 at 8:31 PM Will Deacon <will@kernel.org> wrote:
> >
> > Although swiotlb_exit() frees the 'slots' metadata array referenced by
> > 'io_tlb_default_mem', it leaves the underlying buffer pages allocated
> > despite no longer being usable.
> >
> > Extend swiotlb_exit() to free the buffer pages as well as the slots
> > array.
> >
> > Cc: Claire Chang <tientzu@chromium.org>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
> 
> Tested-by: Claire Chang <tientzu@chromium.org>

Thanks, Claire!

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
