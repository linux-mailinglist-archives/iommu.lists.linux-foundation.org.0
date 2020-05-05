Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 128081C55CC
	for <lists.iommu@lfdr.de>; Tue,  5 May 2020 14:40:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BF88C86F4E;
	Tue,  5 May 2020 12:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZpvSiZw2nR4; Tue,  5 May 2020 12:40:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6E8D586DCD;
	Tue,  5 May 2020 12:40:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55792C0175;
	Tue,  5 May 2020 12:40:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77FEFC0175
 for <iommu@lists.linux-foundation.org>; Tue,  5 May 2020 12:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6683687CE4
 for <iommu@lists.linux-foundation.org>; Tue,  5 May 2020 12:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UPelELEcasNE for <iommu@lists.linux-foundation.org>;
 Tue,  5 May 2020 12:40:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 86B2A8783B
 for <iommu@lists.linux-foundation.org>; Tue,  5 May 2020 12:40:28 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B6CCF39A; Tue,  5 May 2020 14:40:26 +0200 (CEST)
Date: Tue, 5 May 2020 14:40:25 +0200
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: Re: [PATCH 0/5] iommu/amd: Fix race conditions around
 increase_address_space()
Message-ID: <20200505124025.GC18353@8bytes.org>
References: <20200504125413.16798-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504125413.16798-1-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org
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

On Mon, May 04, 2020 at 02:54:08PM +0200, Joerg Roedel wrote:
> Joerg Roedel (5):
>   iommu/amd: Fix race in increase_address_space()/fetch_pte()
>   iommu/amd: Do not loop forever when trying to increase address space
>   iommu/amd: Call domain_flush_complete() in update_domain()
>   iommu/amd: Update Device Table in increase_address_space()
>   iommu/amd: Do not flush Device Table in iommu_map_page()
> 
>  drivers/iommu/amd_iommu.c       | 198 +++++++++++++++++++++++++-------
>  drivers/iommu/amd_iommu_types.h |   9 +-
>  2 files changed, 161 insertions(+), 46 deletions(-)

Applied for v5.7.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
