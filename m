Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB5A305AC6
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 13:06:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BCF20860DC;
	Wed, 27 Jan 2021 12:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okKHt+lssrMa; Wed, 27 Jan 2021 12:06:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A0E2881D69;
	Wed, 27 Jan 2021 12:06:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A0E8C013A;
	Wed, 27 Jan 2021 12:06:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 845D1C013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 12:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5BC1521511
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 12:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TUnFAYgsUVec for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 12:06:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 79D1421509
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 12:06:43 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 14E8F303; Wed, 27 Jan 2021 13:06:42 +0100 (CET)
Date: Wed, 27 Jan 2021 13:06:40 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v4 00/13] iommu/amd: Add Generic IO Page Table Framework
 Support
Message-ID: <20210127120640.GF32671@8bytes.org>
References: <20201215073705.123786-1-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215073705.123786-1-suravee.suthikulpanit@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, will@kernel.org,
 linux-kernel@vger.kernel.org
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

Hi Suravee,

On Tue, Dec 15, 2020 at 01:36:52AM -0600, Suravee Suthikulpanit wrote:
 
> Suravee Suthikulpanit (13):
>   iommu/amd: Re-define amd_iommu_domain_encode_pgtable as inline
>   iommu/amd: Prepare for generic IO page table framework
>   iommu/amd: Move pt_root to struct amd_io_pgtable
>   iommu/amd: Convert to using amd_io_pgtable
>   iommu/amd: Declare functions as extern
>   iommu/amd: Move IO page table related functions
>   iommu/amd: Restructure code for freeing page table
>   iommu/amd: Remove amd_iommu_domain_get_pgtable
>   iommu/amd: Rename variables to be consistent with struct
>     io_pgtable_ops
>   iommu/amd: Refactor fetch_pte to use struct amd_io_pgtable
>   iommu/amd: Introduce iommu_v1_iova_to_phys
>   iommu/amd: Introduce iommu_v1_map_page and iommu_v1_unmap_page
>   iommu/amd: Adopt IO page table framework for AMD IOMMU v1 page table

Applied this series, thanks for the work! Given testing goes well you
can consider this queued for 5.12.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
