Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FD5276CD6
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 11:09:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 95C62869F4;
	Thu, 24 Sep 2020 09:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id du8nC4u7yu3S; Thu, 24 Sep 2020 09:09:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 466F286A0F;
	Thu, 24 Sep 2020 09:09:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 296EAC0051;
	Thu, 24 Sep 2020 09:09:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 740F8C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 09:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4CAA127E4C
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 09:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfDovfFuy85q for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 09:09:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id A82682045D
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 09:09:00 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C04143D1; Thu, 24 Sep 2020 11:08:58 +0200 (CEST)
Date: Thu, 24 Sep 2020 11:08:57 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH] Revert "iommu/amd: Treat per-device exclusion ranges as
 r/w unity-mapped regions"
Message-ID: <20200924090857.GG27174@8bytes.org>
References: <20200923022655.750-1-bhe@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923022655.750-1-bhe@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, ahuang12@lenovo.com,
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

On Wed, Sep 23, 2020 at 10:26:55AM +0800, Baoquan He wrote:
> A regression failure of kdump kernel boot was reported on a HPE system.
> Bisect points at commit 387caf0b759ac43 ("iommu/amd: Treat per-device
> exclusion ranges as r/w unity-mapped regions") as criminal. Reverting it
> fix the failure.
> 
> With the commit, kdump kernel will always print below error message, then
> naturally AMD iommu can't function normally during kdump kernel bootup.
> 
>   ~~~~~~~~~
>   AMD-Vi: [Firmware Bug]: IVRS invalid checksum
> 
> Why commit 387caf0b759ac43 causing it haven't been made clear.

I think this should be debugged further, in future IOMMUs the exclusion
range feature will not be available anymore (mmio-fields get re-used for
SNP). So starting to use them again is not going to work.

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
