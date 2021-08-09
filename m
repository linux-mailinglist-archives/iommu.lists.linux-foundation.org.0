Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id F056E3E4EF8
	for <lists.iommu@lfdr.de>; Tue, 10 Aug 2021 00:09:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C9D82C8E;
	Mon,  9 Aug 2021 22:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ADgZyjB2EzhS; Mon,  9 Aug 2021 22:09:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 90EFD831A2;
	Mon,  9 Aug 2021 22:09:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B8B4C001F;
	Mon,  9 Aug 2021 22:09:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70D40C000E
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 22:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ACAD8317B
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 22:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FsFPFxbRJnNo for <iommu@lists.linux-foundation.org>;
 Mon,  9 Aug 2021 22:08:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC2BF82C8E
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 22:08:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="201971155"
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="201971155"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 15:08:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="674425257"
Received: from pmmonter-mobl1.amr.corp.intel.com (HELO
 skuppusw-mobl5.amr.corp.intel.com) ([10.212.72.120])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 15:08:55 -0700
Subject: Re: [PATCH 06/11] x86/sev: Replace occurrences of sev_es_active()
 with prot_guest_has()
To: Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <joro@8bytes.org>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <ba565128b88661a656fc3972f01bb2e295158a15.1627424774.git.thomas.lendacky@amd.com>
 <YQfMw2FRO5M1osGF@8bytes.org> <934f3e72-49d1-be56-6fa2-f37a02413fb2@amd.com>
From: "Kuppuswamy, Sathyanarayanan"
 <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <e63c166f-fd56-4aba-3d4f-b2d10051769a@linux.intel.com>
Date: Mon, 9 Aug 2021 15:08:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <934f3e72-49d1-be56-6fa2-f37a02413fb2@amd.com>
Content-Language: en-US
Cc: linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
 Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, x86@kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 iommu@lists.linux-foundation.org, Andi Kleen <ak@linux.intel.com>,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@redhat.com>
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



On 8/9/21 2:59 PM, Tom Lendacky wrote:
>> Not sure how TDX will handle AP booting, are you sure it needs this
>> special setup as well? Otherwise a check for SEV-ES would be better
>> instead of the generic PATTR_GUEST_PROT_STATE.
> Yes, I'm not sure either. I figure that change can be made, if needed, as
> part of the TDX support.

We don't plan to set PROT_STATE. So it does not affect TDX.
For SMP, we use MADT ACPI table for AP booting.

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
