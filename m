Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A55F21E81F9
	for <lists.iommu@lfdr.de>; Fri, 29 May 2020 17:38:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6590D874C5;
	Fri, 29 May 2020 15:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wh7ciP-ekLRZ; Fri, 29 May 2020 15:38:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED442874C8;
	Fri, 29 May 2020 15:38:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CDBD3C07FF;
	Fri, 29 May 2020 15:38:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 310E9C016F
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 15:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 16C1B88432
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 15:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ty2wL7eIyWal for <iommu@lists.linux-foundation.org>;
 Fri, 29 May 2020 15:38:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7C0A8883A9
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 15:38:26 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id BEBD850C; Fri, 29 May 2020 17:38:23 +0200 (CEST)
Date: Fri, 29 May 2020 17:38:22 +0200
From: Joerg Roedel <joro@8bytes.org>
To: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, jroedel@suse.de
Subject: Re: [PATCH 01/10] iommu/amd: Move AMD IOMMU driver to a subdirectory
Message-ID: <20200529153822.GH14598@8bytes.org>
References: <20200527115313.7426-1-joro@8bytes.org>
 <20200527115313.7426-2-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527115313.7426-2-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, May 27, 2020 at 01:53:04PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The driver consists of five C files and three header files by now.
> Move them to their own subdirectory to not clutter to iommu top-level
> directory with them.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  MAINTAINERS                                          | 2 +-
>  drivers/iommu/Makefile                               | 6 +++---
>  drivers/iommu/{ => amd}/amd_iommu.h                  | 0
>  drivers/iommu/{ => amd}/amd_iommu_proto.h            | 0
>  drivers/iommu/{ => amd}/amd_iommu_types.h            | 0
>  drivers/iommu/{amd_iommu_debugfs.c => amd/debugfs.c} | 0
>  drivers/iommu/{amd_iommu_init.c => amd/init.c}       | 2 +-
>  drivers/iommu/{amd_iommu.c => amd/iommu.c}           | 2 +-
>  drivers/iommu/{amd_iommu_v2.c => amd/iommu_v2.c}     | 0
>  drivers/iommu/{amd_iommu_quirks.c => amd/quirks.c}   | 0
>  10 files changed, 6 insertions(+), 6 deletions(-)
>  rename drivers/iommu/{ => amd}/amd_iommu.h (100%)
>  rename drivers/iommu/{ => amd}/amd_iommu_proto.h (100%)
>  rename drivers/iommu/{ => amd}/amd_iommu_types.h (100%)
>  rename drivers/iommu/{amd_iommu_debugfs.c => amd/debugfs.c} (100%)
>  rename drivers/iommu/{amd_iommu_init.c => amd/init.c} (99%)
>  rename drivers/iommu/{amd_iommu.c => amd/iommu.c} (99%)
>  rename drivers/iommu/{amd_iommu_v2.c => amd/iommu_v2.c} (100%)
>  rename drivers/iommu/{amd_iommu_quirks.c => amd/quirks.c} (100%)

Okay, so there were a lot of conflicts creating my next branch after this
patch-set was applied, so I skipped this patch to make resolving them a
bit easier.

I will send out this patch again separatly together with a patch doing
the same for VT-d and merge it directly into the next branch I will send
to Linus.


	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
