Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8AB228E46
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 04:45:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B7CDF88606;
	Wed, 22 Jul 2020 02:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84lDYzp4pppx; Wed, 22 Jul 2020 02:45:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A6A5488604;
	Wed, 22 Jul 2020 02:45:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 921B0C016F;
	Wed, 22 Jul 2020 02:45:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9344AC016F
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 02:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8916988606
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 02:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rWKHA1rUAfcd for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 02:45:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ECADA88604
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 02:45:11 +0000 (UTC)
IronPort-SDR: NFxoTQ6ShcA7f95elML1/ZI8G4+6DkHxxzKc2P7tBfjr3mpIApSh0+Fj6SAymcMitGXJDGsIty
 TvaDQt9IwKdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="151590015"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="151590015"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 19:45:06 -0700
IronPort-SDR: RmFrsz1pSqV972rnpbM1aylP3SgTt9vSuztKszdJZg4PSgL0Fca7zEH2cHTU+JIBJOV9MRyXS9
 gPOevvMW1Rsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="392541736"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2020 19:45:05 -0700
Subject: Re: Subject: Re: [PATCH 1/1] iommu/vt-d: Skip TE disabling on quirky
 gfx dedicated iommu
To: "Miao, Jun" <Jun.Miao@windriver.com>
References: <DM6PR11MB2587034DFBEDFB091CE9AAD58E790@DM6PR11MB2587.namprd11.prod.outlook.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <0f4b6760-bb8f-ebd3-ab9d-4ecba819883c@linux.intel.com>
Date: Wed, 22 Jul 2020 10:40:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB2587034DFBEDFB091CE9AAD58E790@DM6PR11MB2587.namprd11.prod.outlook.com>
Content-Language: en-US
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Jun,

On 7/22/20 10:26 AM, Miao, Jun wrote:
>>> Kernel panic - not syncing: DMAR hardware is malfunctioning
>>> CPU: 0 PID: 347 Comm: rtcwake Not tainted 5.4.0-yocto-standard #124
>>> Hardware name: Intel Corporation Ice Lake Client Platform/IceLake U DDR4
>>> SODIMM PD RVP TLC, BIOS ICLSFWR1.R00.3162.A00.1904162000 04/16/2019
>>> Call Trace:
>>>    dump_stack+0x59/0x75
>>>    panic+0xff/0x2d4
>>>    iommu_disable_translation+0x88/0x90
>>>    iommu_suspend+0x12f/0x1b0
>>>    syscore_suspend+0x6c/0x220
>>>    suspend_devices_and_enter+0x313/0x840
>>>    pm_suspend+0x30d/0x390
>>>    state_store+0x82/0xf0
>>>    kobj_attr_store+0x12/0x20
>>>    sysfs_kf_write+0x3c/0x50
>>>    kernfs_fop_write+0x11d/0x190
>>>    __vfs_write+0x1b/0x40
>>>    vfs_write+0xc6/0x1d0
>>>    ksys_write+0x5e/0xe0
>>>    __x64_sys_write+0x1a/0x20
>>>    do_syscall_64+0x4d/0x150
>>>    entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>> RIP: 0033:0x7f97b8080113
>>> Code: 8b 15 81 bd 0c 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00
>>> 64 8b 04 25 18 00 00 00 85 c0 75 14 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff
>>> 77 55 c3 0f 1f 40 00 48 83 ec 28 48 89 54 24 18
>>> RSP: 002b:00007ffcfa6f48b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
>>> RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f97b8080113
>>> RDX: 0000000000000004 RSI: 000055e7db03b700 RDI: 0000000000000004
>>> RBP: 000055e7db03b700 R08: 000055e7db03b700 R09: 0000000000000004
>>> R10: 0000000000000004 R11: 0000000000000246 R12: 0000000000000004
>>> R13: 000055e7db039380 R14: 0000000000000004 R15: 00007f97b814d700
>>> Kernel Offset: 0x38a00000 from 0xffffffff81000000 (relocation range:
>>> 0xffffffff80000000-0xffffffffbfffffff)
>>> ---[ end Kernel panic - not syncing: DMAR hardware is malfunctioning ]---
>

Do you mean that system hangs in iommu_disable_translation() without 
this fix.

> [S3 successfully with the patch]

And, this failure disappeared after you applied this fix?

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
