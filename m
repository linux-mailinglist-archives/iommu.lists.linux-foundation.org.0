Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 596E52A9768
	for <lists.iommu@lfdr.de>; Fri,  6 Nov 2020 15:06:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2083486A14;
	Fri,  6 Nov 2020 14:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vOwUhLOvH303; Fri,  6 Nov 2020 14:06:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5955581514;
	Fri,  6 Nov 2020 14:06:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45FB8C0889;
	Fri,  6 Nov 2020 14:06:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69876C0889
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 14:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5191486824
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 14:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPX1GBe332ym for <iommu@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 14:06:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 011018676A
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 14:06:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0F59ABE3;
 Fri,  6 Nov 2020 14:06:26 +0000 (UTC)
Date: Fri, 6 Nov 2020 15:06:25 +0100
From: "jroedel@suse.de" <jroedel@suse.de>
To: "Merger, Edgar [AUTOSOL/MAS/AUGS]" <Edgar.Merger@emerson.com>
Subject: Re: [EXTERNAL] Re: amdgpu error whenever IOMMU is enabled
Message-ID: <20201106140625.GU22179@suse.de>
References: <MWHPR10MB13109574BDA0F1D8219A225C89EF0@MWHPR10MB1310.namprd10.prod.outlook.com>
 <20201104101454.GR22179@suse.de>
 <MWHPR10MB13108FAFDAD3D33132B6593489EF0@MWHPR10MB1310.namprd10.prod.outlook.com>
 <MWHPR10MB13106AFEA3B68E666DD9CA6089EF0@MWHPR10MB1310.namprd10.prod.outlook.com>
 <MWHPR10MB13107C8A602FD7EE065F4E3D89EE0@MWHPR10MB1310.namprd10.prod.outlook.com>
 <MWHPR10MB1310AA6CDF577A1535600F7089EE0@MWHPR10MB1310.namprd10.prod.outlook.com>
 <20201105123245.GS22179@suse.de>
 <MWHPR10MB1310C1E8308484E2F7F967E889ED0@MWHPR10MB1310.namprd10.prod.outlook.com>
 <20201106121850.GT22179@suse.de>
 <MWHPR10MB1310A315F2AB752DC789D4E689ED0@MWHPR10MB1310.namprd10.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR10MB1310A315F2AB752DC789D4E689ED0@MWHPR10MB1310.namprd10.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

On Fri, Nov 06, 2020 at 01:03:22PM +0000, Merger, Edgar [AUTOSOL/MAS/AUGS] wrote:
> Thank you. I do think that this is the GPU. Would you please elaborate
> on what that quirk would be?

The GPU seems to have broken ATS, or require driver setup to make ATS
work. Anyhow, ATS is unstable for Linux to use, so it must not be
enabled.

This diff to the kernel should do that:

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index f70692ac79c5..3911b0ec57ba 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5176,6 +5176,8 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6900, quirk_amd_harvest_no_ats);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x7312, quirk_amd_harvest_no_ats);
 /* AMD Navi14 dGPU */
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x7340, quirk_amd_harvest_no_ats);
+/* AMD Raven platform iGPU */
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x15d8, quirk_amd_harvest_no_ats);
 #endif /* CONFIG_PCI_ATS */
 
 /* Freescale PCIe doesn't support MSI in RC mode */
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
