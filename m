Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A7A2304FF
	for <lists.iommu@lfdr.de>; Tue, 28 Jul 2020 10:10:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8A6F8883A3;
	Tue, 28 Jul 2020 08:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdSQeLOwIz7R; Tue, 28 Jul 2020 08:10:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 78E6288378;
	Tue, 28 Jul 2020 08:10:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FFE7C0864;
	Tue, 28 Jul 2020 08:10:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72E7FC004D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 08:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6AE328839E
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 08:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nc9alFTKmLHf for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 08:09:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4D9D788388
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 08:09:57 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id f9so4927956pju.4
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 01:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mO4UW6jhce2IwLYWJIjyNoNVa+Gr5PBQ2rV1LkhhIeA=;
 b=bNG6JL/O5TVQki3sHfHEOfTczEIMUXR0OLqZGWSVnVXN0YvSLXQj4R1CZin1hIrLmj
 rDRSSHKktD8YAK18dQ3Ix7Lo07yJ8erIxBxxxxqVLyUXKDeyjbkBvyU6KTuEXDNL+VQr
 1QQzuFpqB0CYmf+5pX3A4eJDz9R/FeezQPycBuGnXY4EFLSYZVijwWE1t6E2M5B99qAH
 FniHRX5RxN1gZw65OKCdqnG/UzIrS3ICQ278hYR6IoGyzyd6ykow+PajTtCN7ldzFD83
 Hcz6o03i9dPHjv0yz+B7ucVCSupfsp/DKM7XkQQq14g4beE60uqTFBLLU79wWmkWweg4
 xE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mO4UW6jhce2IwLYWJIjyNoNVa+Gr5PBQ2rV1LkhhIeA=;
 b=J4JvqFG6BFPAjH8YOBV1fAvPNO/jfIYEc0bpaBm9YsE8mWZe6xH3prpNNqVr7O5Fc0
 +TeHccZER+uENYg6FmN40pzKgxw7qEzVEKlbiAQeRcq6VzfaUk7PZEMvYJ4RSoiYCVbc
 R6qGyLJVdcy76Ac/0a/s7KF2VgrVzsXBOiQM/Tf7pg1R9t9OrMS4Q/2ueOztMXUAtOxS
 huXulk6EkBoudWO7IJLUgzUdLXeSxbjlCQzppA+0RYcLGFehw1oO7OGNZgbWwLBj3L6p
 GpW5g8d7KqN96ZZTdSFYtInSQHk0uxlziu8z2nvLaolWvS51Rg7wvl72ffc5n6WwX0A8
 07ig==
X-Gm-Message-State: AOAM530e1DjpetIcHyfAZaRt5/qqtQA322fveA+JlsKOAo0gCfKrlSd6
 BI7vK2C3pUepWdJOFFLJY8zFVhAIrGapPCJgWXs=
X-Google-Smtp-Source: ABdhPJwl2tr9ClL3asn7D0daWCLxpbWcicGBHl3RglmUadciWpYNtKvtb4F0xzOXS215QqSA9z2se3QNEhc8iGYlMEA=
X-Received: by 2002:a17:90a:8918:: with SMTP id
 u24mr3082134pjn.7.1595923796912; 
 Tue, 28 Jul 2020 01:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-4-rppt@kernel.org>
In-Reply-To: <20200728051153.1590-4-rppt@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 28 Jul 2020 01:09:45 -0700
Message-ID: <CAMo8Bf+VKHmAm1GV=0D9Um2mpsxjnwp9WrAJq_eKW1MK+_8r6g@mail.gmail.com>
Subject: Re: [PATCH 03/15] arm,
 xtensa: simplify initialization of high memory pages
To: Mike Rapoport <rppt@kernel.org>
Cc: "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>,
 "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Stafford Horne <shorne@gmail.com>, linux-s390 <linux-s390@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
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

On Mon, Jul 27, 2020 at 10:12 PM Mike Rapoport <rppt@kernel.org> wrote:
>
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> The function free_highpages() in both arm and xtensa essentially open-code
> for_each_free_mem_range() loop to detect high memory pages that were not
> reserved and that should be initialized and passed to the buddy allocator.
>
> Replace open-coded implementation of for_each_free_mem_range() with usage
> of memblock API to simplify the code.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/arm/mm/init.c    | 48 +++++++------------------------------
>  arch/xtensa/mm/init.c | 55 ++++++++-----------------------------------
>  2 files changed, 18 insertions(+), 85 deletions(-)

For the xtensa part:
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Tested-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
