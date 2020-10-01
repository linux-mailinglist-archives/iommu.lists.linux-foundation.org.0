Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E9B27FECA
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 14:12:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C0662204D7;
	Thu,  1 Oct 2020 12:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vz4eUa87mFX; Thu,  1 Oct 2020 12:12:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C9AFB204CF;
	Thu,  1 Oct 2020 12:12:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 917F1C0051;
	Thu,  1 Oct 2020 12:12:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35F4AC0051
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 12:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2B77D86B7D
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 12:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CtuEnPWC893q for <iommu@lists.linux-foundation.org>;
 Thu,  1 Oct 2020 12:12:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B12B98235D
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 12:12:15 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 806FD2C3; Thu,  1 Oct 2020 14:12:12 +0200 (CEST)
Date: Thu, 1 Oct 2020 14:12:11 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Adrian Huang <adrianhuang0701@gmail.com>
Subject: Re: [PATCH 1/1] iommu/amd: Fix the overwritten field in IVMD header
Message-ID: <20201001121210.GA30426@8bytes.org>
References: <20200926102602.19177-1-adrianhuang0701@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200926102602.19177-1-adrianhuang0701@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Adrian Huang <ahuang12@lenovo.com>
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

On Sat, Sep 26, 2020 at 06:26:02PM +0800, Adrian Huang wrote:
> From: Adrian Huang <ahuang12@lenovo.com>
> 
> Commit 387caf0b759a ("iommu/amd: Treat per-device exclusion
> ranges as r/w unity-mapped regions") accidentally overwrites
> the 'flags' field in IVMD (struct ivmd_header) when the I/O
> virtualization memory definition is associated with the
> exclusion range entry. This leads to the corrupted IVMD table
> (incorrect checksum). The kdump kernel reports the invalid checksum:
> 
> ACPI BIOS Warning (bug): Incorrect checksum in table [IVRS] - 0x5C, should be 0x60 (20200717/tbprint-177)
> AMD-Vi: [Firmware Bug]: IVRS invalid checksum
> 
> Fix the above-mentioned issue by modifying the 'struct unity_map_entry'
> member instead of the IVMD header.
> 
> Cleanup: The *exclusion_range* functions are not used anymore, so
> get rid of them.
> 
> Fixes: 387caf0b759a ("iommu/amd: Treat per-device exclusion ranges as r/w unity-mapped regions")
> Reported-and-tested-by: Baoquan He <bhe@redhat.com>
> Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
> Cc: Jerry Snitselaar <jsnitsel@redhat.com>
> ---
>  drivers/iommu/amd/init.c | 56 +++++++---------------------------------
>  1 file changed, 10 insertions(+), 46 deletions(-)

Applied for v5.9, thanks everyone.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
