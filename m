Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DA05A21B51A
	for <lists.iommu@lfdr.de>; Fri, 10 Jul 2020 14:31:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 293C7267D6;
	Fri, 10 Jul 2020 12:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2wudxsihGJOQ; Fri, 10 Jul 2020 12:31:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6EBB826B51;
	Fri, 10 Jul 2020 12:31:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E35EC016F;
	Fri, 10 Jul 2020 12:31:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E3E0C016F
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 12:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4732789C4F
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 12:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFfAHBC3NLAq for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 12:31:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E881B88A83
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 12:31:06 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 83BE420C; Fri, 10 Jul 2020 14:31:03 +0200 (CEST)
Date: Fri, 10 Jul 2020 14:31:00 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sebastian Ott <sebott@amazon.de>
Subject: Re: [PATCH v2 0/3] iommu/amd: I/O VA address limits
Message-ID: <20200710123059.GF27672@8bytes.org>
References: <20200630093039.GC28824@8bytes.org>
 <20200630224634.319-1-sebott@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630224634.319-1-sebott@amazon.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Benjamin Serebrin <serebrin@amazon.com>, Filippo Sironi <sironi@amazon.de>,
 iommu@lists.linux-foundation.org
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

Hi Sebastian,

On Wed, Jul 01, 2020 at 12:46:31AM +0200, Sebastian Ott wrote:
> The IVRS ACPI table specifies maximum address sizes for I/O virtual
> addresses that can be handled by the IOMMUs in the system. Parse that
> data from the IVRS header to provide aperture information for DMA
> mappings and users of the iommu API.
> 
> Changes for V2:
>  - use limits in iommu_setup_dma_ops()
>  - rebased to current upstream
> 
> Sebastian Ott (3):
>   iommu/amd: Parse supported address sizes from IVRS
>   iommu/amd: Restrict aperture for domains to conform with IVRS
>   iommu/amd: Actually enforce geometry aperture

Thanks for the changes. May I ask what the reason for those changes are?
AFAIK all AMD IOMMU implementations (in hardware) support full 64bit
address spaces, and the IVRS table might actually be wrong, limiting the
address space in the worst case to only 32 bit.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
