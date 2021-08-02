Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B2A3DD431
	for <lists.iommu@lfdr.de>; Mon,  2 Aug 2021 12:45:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8864883A93;
	Mon,  2 Aug 2021 10:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jsCMEgHZ3-7T; Mon,  2 Aug 2021 10:45:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8F1A682C33;
	Mon,  2 Aug 2021 10:45:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7470EC0022;
	Mon,  2 Aug 2021 10:45:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57FC1C000E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 10:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46E9283A87
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 10:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZLVGVsXyHhnM for <iommu@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 10:45:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 930B082C33
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 10:45:26 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A1662379; Mon,  2 Aug 2021 12:45:24 +0200 (CEST)
Date: Mon, 2 Aug 2021 12:45:23 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 06/11] x86/sev: Replace occurrences of sev_es_active()
 with prot_guest_has()
Message-ID: <YQfMw2FRO5M1osGF@8bytes.org>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <ba565128b88661a656fc3972f01bb2e295158a15.1627424774.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba565128b88661a656fc3972f01bb2e295158a15.1627424774.git.thomas.lendacky@amd.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Jul 27, 2021 at 05:26:09PM -0500, Tom Lendacky wrote:
> @@ -48,7 +47,7 @@ static void sme_sev_setup_real_mode(struct trampoline_header *th)
>  	if (prot_guest_has(PATTR_HOST_MEM_ENCRYPT))
>  		th->flags |= TH_FLAGS_SME_ACTIVE;
>  
> -	if (sev_es_active()) {
> +	if (prot_guest_has(PATTR_GUEST_PROT_STATE)) {
>  		/*
>  		 * Skip the call to verify_cpu() in secondary_startup_64 as it
>  		 * will cause #VC exceptions when the AP can't handle them yet.

Not sure how TDX will handle AP booting, are you sure it needs this
special setup as well? Otherwise a check for SEV-ES would be better
instead of the generic PATTR_GUEST_PROT_STATE.

Regards,

Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
