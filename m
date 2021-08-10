Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A803D8EFB
	for <lists.iommu@lfdr.de>; Wed, 28 Jul 2021 15:25:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55CEC405B7;
	Wed, 28 Jul 2021 13:25:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSA5EoOsFkA5; Wed, 28 Jul 2021 13:25:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 82AFD405F7;
	Wed, 28 Jul 2021 13:25:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C8FAC000E;
	Wed, 28 Jul 2021 13:25:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F5D8C000E
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 13:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80CA0405C0
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 13:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F0DC-MKsb5x4 for <iommu@lists.linux-foundation.org>;
 Wed, 28 Jul 2021 13:25:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE9A1405B7
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wyV5oHahoyFyDlkMKSruinnsahdkugSgLawjHfbEEjQ=; b=CxvZX41K0o1QkS+QNIrwd0eOBe
 mqQ6PrksWIat6lXJKZPun+q1pAOQx0xLcn0dXI0f5/QwQmDJVibY4qE3c7TAdHgsIiPO3KhQic7GW
 1eyfOJ6+e5m0vdD3PZ+UIsWjdf71Rv+qjxbud/TVWu09HUCIEgoxhatZ/TSoyrl9g8w0xVsK0qnJb
 Ssgb2vj86C8FXbvbGsNNF9o/MH3FUfh7M9nUfPwhEPmwHvq/+B3ENaQ00GINALSLZBrB8jUNO3eAN
 ZD343FSM3tMyDXd6949QP8wSOuEJ0mt327HB6lpEtnWhWjFhF6Z9hGOLbHanuC9ie9QiNGCSpAJVM
 Xwq8/NVQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m8jWV-00G5AN-CH; Wed, 28 Jul 2021 13:23:16 +0000
Date: Wed, 28 Jul 2021 14:22:59 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 02/11] x86/sev: Add an x86 version of prot_guest_has()
Message-ID: <YQFaM7nOhD2d6SUQ@infradead.org>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <b3e929a77303dd47fd2adc2a1011009d3bfcee20.1627424774.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3e929a77303dd47fd2adc2a1011009d3bfcee20.1627424774.git.thomas.lendacky@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-s390@vger.kernel.org,
 Andi Kleen <ak@linux.intel.com>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, linux-graphics-maintainer@vmware.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
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

On Tue, Jul 27, 2021 at 05:26:05PM -0500, Tom Lendacky via iommu wrote:
> Introduce an x86 version of the prot_guest_has() function. This will be
> used in the more generic x86 code to replace vendor specific calls like
> sev_active(), etc.
> 
> While the name suggests this is intended mainly for guests, it will
> also be used for host memory encryption checks in place of sme_active().
> 
> The amd_prot_guest_has() function does not use EXPORT_SYMBOL_GPL for the
> same reasons previously stated when changing sme_active(), sev_active and

None of that applies here as none of the callers get pulled into
random macros.  The only case of that is sme_me_mask through
sme_mask, but that's not something this series replaces as far as I can
tell.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
