Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1FC414C06
	for <lists.iommu@lfdr.de>; Wed, 22 Sep 2021 16:31:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 551AD401E9;
	Wed, 22 Sep 2021 14:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNYGMNcxRrqH; Wed, 22 Sep 2021 14:31:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 26F134058A;
	Wed, 22 Sep 2021 14:31:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00A3AC0022;
	Wed, 22 Sep 2021 14:31:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 175DFC000D
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 14:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED0F884089
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 14:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=shutemov-name.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sczJfxOzjHGE for <iommu@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 14:31:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D618B84085
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 14:31:44 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id b20so12925384lfv.3
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 07:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ayCGrHt4GWDBHksaWpDlFPsTDgmCQyv1ZQQyBUlWV+I=;
 b=vKVQE5RUe8kMs0wun4XuDGO3eTujOGs2RwESdLhyIqK2JwxlqZrlSJy3MrsXJkRafX
 gBAYy/nccugQKoUll1gn8VoFbzjQhjrLzptB1R76SapyouDJT5ZGJIWbG+FX4hwJyS6V
 RHRd5aepSbIC42CmHtd5u+dR4xuEL++muo/z0NTk8BMGL92wAA2PmP9KOi2aYe71/Bfr
 QklC4Nhk0K/0QbQiJZijepS1OZ+jtAxihfchh+jQ4jf5+4U17tQ1xXPBbmD5a5nhc0Gd
 SVGSB9p7xAW0QvKqL518rFLXTD4w7KZA2wBif/Kp2RKz31Lh+5HyNQaqaSmkfOyisrNC
 k+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ayCGrHt4GWDBHksaWpDlFPsTDgmCQyv1ZQQyBUlWV+I=;
 b=dZDT1XgPYIAruNzjTiCfQF65hjz/FId6dn/qu/QMKG18B6156UEgWp4qwSZaepD+td
 04iPjmSTTutQsj/DHddCTV9qtLtRt3jV9vGwdfmIS9xd6FktvIaIoNpbCCcTocTAXyv6
 St9UpXQTZxklY+LRUL9Yo1hVI+RvWfJDxqR/uc2eu3qel4MVqIEMkx3WqOI8SIcnyQbI
 D81lt1JC9xwRYhD04xhyxvYWukFRc1BzsJV9bOxk5nmbVqE/bkvbyH3SoLZxLkz/3Q+d
 dXZEZifdHHCyQ2TuhPhZZY5XM/PYe7HWcHPs7VcuLPKVFymlG9EQ4mcT100FKt6D4o52
 Iekg==
X-Gm-Message-State: AOAM532zy3fbJgTiWCQRonFIMjHJUx6m8XMyQ8rsYLUtOgOFZQ/nDggs
 uwsP6hSCrZISXCi1gVgXIfmjIA==
X-Google-Smtp-Source: ABdhPJz3SPlP/oK9QpFHL+xKtQ0nQUgNyOd556PIkN1KxMSQUqIwOiDbPwtupEbWOJByEgde/ChetQ==
X-Received: by 2002:a05:651c:512:: with SMTP id
 o18mr35155713ljp.199.1632321016184; 
 Wed, 22 Sep 2021 07:30:16 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id y9sm205960lfl.240.2021.09.22.07.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:30:15 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id E147C10304D; Wed, 22 Sep 2021 17:30:15 +0300 (+03)
Date: Wed, 22 Sep 2021 17:30:15 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v3 5/8] x86/sme: Replace occurrences of sme_active() with
 cc_platform_has()
Message-ID: <20210922143015.vvxvh6ec73lffvkf@box.shutemov.name>
References: <367624d43d35d61d5c97a8b289d9ddae223636e9.1631141919.git.thomas.lendacky@amd.com>
 <20210920192341.maue7db4lcbdn46x@box.shutemov.name>
 <77df37e1-0496-aed5-fd1d-302180f1edeb@amd.com>
 <YUoao0LlqQ6+uBrq@zn.tnic>
 <20210921212059.wwlytlmxoft4cdth@box.shutemov.name>
 <YUpONYwM4dQXAOJr@zn.tnic>
 <20210921213401.i2pzaotgjvn4efgg@box.shutemov.name>
 <00f52bf8-cbc6-3721-f40e-2f51744751b0@amd.com>
 <20210921215830.vqxd75r4eyau6cxy@box.shutemov.name>
 <01891f59-7ec3-cf62-a8fc-79f79ca76587@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01891f59-7ec3-cf62-a8fc-79f79ca76587@amd.com>
Cc: linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
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

On Wed, Sep 22, 2021 at 08:40:43AM -0500, Tom Lendacky wrote:
> On 9/21/21 4:58 PM, Kirill A. Shutemov wrote:
> > On Tue, Sep 21, 2021 at 04:43:59PM -0500, Tom Lendacky wrote:
> > > On 9/21/21 4:34 PM, Kirill A. Shutemov wrote:
> > > > On Tue, Sep 21, 2021 at 11:27:17PM +0200, Borislav Petkov wrote:
> > > > > On Wed, Sep 22, 2021 at 12:20:59AM +0300, Kirill A. Shutemov wrote:
> > > > > > I still believe calling cc_platform_has() from __startup_64() is totally
> > > > > > broken as it lacks proper wrapping while accessing global variables.
> > > > > 
> > > > > Well, one of the issues on the AMD side was using boot_cpu_data too
> > > > > early and the Intel side uses it too. Can you replace those checks with
> > > > > is_tdx_guest() or whatever was the helper's name which would check
> > > > > whether the the kernel is running as a TDX guest, and see if that helps?
> > > > 
> > > > There's no need in Intel check this early. Only AMD need it. Maybe just
> > > > opencode them?
> > > 
> > > Any way you can put a gzipped/bzipped copy of your vmlinux file somewhere I
> > > can grab it from and take a look at it?
> > 
> > You can find broken vmlinux and bzImage here:
> > 
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdrive.google.com%2Fdrive%2Ffolders%2F1n74vUQHOGebnF70Im32qLFY8iS3wvjIs%3Fusp%3Dsharing&amp;data=04%7C01%7Cthomas.lendacky%40amd.com%7C1c7adf380cbe4c1a6bb708d97d4af6ff%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637678583935705530%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=gA30x%2Bfu97tUx0p2UqI8HgjiL8bxDbK1GqgJBbUrUE4%3D&amp;reserved=0
> > 
> > Let me know when I can remove it.
> 
> Looking at everything, it is all RIP relative addressing, so those
> accesses should be fine.

Not fine, but waiting to blowup with random build environment change.

> Your image has the intel_cc_platform_has()
> function, does it work if you remove that call? Because I think it may be
> the early call into that function which looks like it has instrumentation
> that uses %gs in __sanitizer_cov_trace_pc and %gs is not setup properly
> yet. And since boot_cpu_data.x86_vendor will likely be zero this early it
> will match X86_VENDOR_INTEL and call into that function.

Right removing call to intel_cc_platform_has() or moving it to
cc_platform.c fixes the issue.

-- 
 Kirill A. Shutemov
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
