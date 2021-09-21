Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 140B9413919
	for <lists.iommu@lfdr.de>; Tue, 21 Sep 2021 19:47:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8304C406C7;
	Tue, 21 Sep 2021 17:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kFoGiQGfj55; Tue, 21 Sep 2021 17:47:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DC5B6406B9;
	Tue, 21 Sep 2021 17:47:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AAEB6C000D;
	Tue, 21 Sep 2021 17:47:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B59EFC000D
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 17:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A38AE40109
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 17:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=alien8.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IyuTUGQTlrCc for <iommu@lists.linux-foundation.org>;
 Tue, 21 Sep 2021 17:47:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86BC540286
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 17:47:29 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0d0600329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:600:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 746911EC0345;
 Tue, 21 Sep 2021 19:47:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1632246441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=Pv/DqLbn5krQkfgrrH2g5wknVz1I55labSKboEsUGSc=;
 b=ICGDEBkQOXOtvX4oj9gLk4HRR4i+JmA+w21a5R5Xi1PZp209y1bcslBK22jtpCHUOsc4bU
 LSOP3yCawLAOD9sDuEbS363bK+pYy6ALcZgCukrJ/yEpf5U57oeFLjS9+b2ZXJHSmQP3/J
 ZoRIqL1GWc7QneVzHnFpO5G9Rs488yE=
Date: Tue, 21 Sep 2021 19:47:15 +0200
From: Borislav Petkov <bp@alien8.de>
To: Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 5/8] x86/sme: Replace occurrences of sme_active() with
 cc_platform_has()
Message-ID: <YUoao0LlqQ6+uBrq@zn.tnic>
References: <cover.1631141919.git.thomas.lendacky@amd.com>
 <367624d43d35d61d5c97a8b289d9ddae223636e9.1631141919.git.thomas.lendacky@amd.com>
 <20210920192341.maue7db4lcbdn46x@box.shutemov.name>
 <77df37e1-0496-aed5-fd1d-302180f1edeb@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77df37e1-0496-aed5-fd1d-302180f1edeb@amd.com>
Cc: linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Will Deacon <will@kernel.org>,
 Andi Kleen <ak@linux.intel.com>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 linux-graphics-maintainer@vmware.com, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Andy Lutomirski <luto@kernel.org>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org
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

On Tue, Sep 21, 2021 at 12:04:58PM -0500, Tom Lendacky wrote:
> Looks like instrumentation during early boot. I worked with Boris offline to
> exclude arch/x86/kernel/cc_platform.c from some of the instrumentation and
> that allowed an allyesconfig to boot.

And here's the lineup I have so far, I'd appreciate it if ppc and s390 folks
could run it too:

https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/log/?h=rc2-cc

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
