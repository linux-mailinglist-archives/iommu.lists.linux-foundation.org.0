Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id AA78953A477
	for <lists.iommu@lfdr.de>; Wed,  1 Jun 2022 13:57:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3B0B40B27;
	Wed,  1 Jun 2022 11:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ESf7kOsMnSfX; Wed,  1 Jun 2022 11:57:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0D0D940AE1;
	Wed,  1 Jun 2022 11:57:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC8F3C007E;
	Wed,  1 Jun 2022 11:57:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DFD2C002D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 11:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 486AB416D7
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 11:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2Qlja1gWA7c for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jun 2022 11:57:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43F39416CE
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 11:57:46 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4E1C168AA6; Wed,  1 Jun 2022 13:57:41 +0200 (CEST)
Date: Wed, 1 Jun 2022 13:57:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: refurbish SWIOTLB SUBSYSTEM sections
 after refactoring
Message-ID: <20220601115741.GA12174@lst.de>
References: <20220601075613.28245-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220601075613.28245-1-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
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

On Wed, Jun 01, 2022 at 09:56:13AM +0200, Lukas Bulwahn wrote:
> +F:	arch/x86/kernel/pci-dma.c

I think this file is better left for the x86 maintainers.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
