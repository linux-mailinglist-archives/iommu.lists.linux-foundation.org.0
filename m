Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 349DC1D0BAA
	for <lists.iommu@lfdr.de>; Wed, 13 May 2020 11:14:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 779FD86BC9;
	Wed, 13 May 2020 09:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id llcq2wv9_4PF; Wed, 13 May 2020 09:14:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0D97D86B45;
	Wed, 13 May 2020 09:14:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E59F0C088B;
	Wed, 13 May 2020 09:14:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A870EC016F
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 09:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9509286B33
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 09:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vskjak_0h5tK for <iommu@lists.linux-foundation.org>;
 Wed, 13 May 2020 09:14:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CE68E86AE4
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 09:14:07 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id DC6B0379; Wed, 13 May 2020 11:14:05 +0200 (CEST)
Date: Wed, 13 May 2020 11:14:04 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Alexander Monakov <amonakov@ispras.ru>
Subject: Re: [PATCH] iommu/amd: fix over-read of ACPI UID from IVRS table
Message-ID: <20200513091404.GI9820@8bytes.org>
References: <20200511102352.1831-1-amonakov@ispras.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511102352.1831-1-amonakov@ispras.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Mon, May 11, 2020 at 10:23:52AM +0000, Alexander Monakov wrote:
> IVRS parsing code always tries to read 255 bytes from memory when
> retrieving ACPI device path, and makes an assumption that firmware
> provides a zero-terminated string. Both of those are bugs: the entry
> is likely to be shorter than 255 bytes, and zero-termination is not
> guaranteed.
> 
> With Acer SF314-42 firmware these issues manifest visibly in dmesg:
> 
> AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0\xf0\xa5, rdevid:160
> AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1\xf0\xa5, rdevid:160
> AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2\xf0\xa5, rdevid:160
> AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3>\x83e\x8d\x9a\xd1...
> 
> The first three lines show how the code over-reads adjacent table
> entries into the UID, and in the last line it even reads garbage data
> beyond the end of the IVRS table itself.
> 
> Since each entry has the length of the UID (uidl member of ivhd_entry
> struct), use that for memcpy, and manually add a zero terminator.
> 
> Avoid zero-filling hid and uid arrays up front, and instead ensure
> the uid array is always zero-terminated. No change needed for the hid
> array, as it was already properly zero-terminated.
> 
> Fixes: 2a0cb4e2d423c ("iommu/amd: Add new map for storing IVHD dev entry type HID")
> 
> Signed-off-by: Alexander Monakov <amonakov@ispras.ru>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: iommu@lists.linux-foundation.org
> ---
>  drivers/iommu/amd_iommu_init.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Applied for v5.7, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
