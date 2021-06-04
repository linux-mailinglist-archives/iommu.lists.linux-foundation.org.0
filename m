Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B9039BC2C
	for <lists.iommu@lfdr.de>; Fri,  4 Jun 2021 17:46:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EF04415B7;
	Fri,  4 Jun 2021 15:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8ZYsf7jsrCs; Fri,  4 Jun 2021 15:46:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFFD4415B3;
	Fri,  4 Jun 2021 15:46:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADE8CC001C;
	Fri,  4 Jun 2021 15:46:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 352CAC0001
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3071184326
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MP0TZKm12ztz for <iommu@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 15:45:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99D658431F
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:45:59 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id EBB623A9; Fri,  4 Jun 2021 17:45:57 +0200 (CEST)
Date: Fri, 4 Jun 2021 17:45:56 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] iommu: Remove unused of_get_dma_window()
Message-ID: <YLpKtG1dnVrcXRSR@8bytes.org>
References: <20210527193710.1281746-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210527193710.1281746-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

On Thu, May 27, 2021 at 02:37:09PM -0500, Rob Herring wrote:
>  drivers/iommu/of_iommu.c | 68 ----------------------------------------
>  include/linux/of_iommu.h | 17 ++--------
>  2 files changed, 3 insertions(+), 82 deletions(-)

Applied both, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
