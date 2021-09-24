Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE67417547
	for <lists.iommu@lfdr.de>; Fri, 24 Sep 2021 15:18:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6C9B4161E;
	Fri, 24 Sep 2021 13:18:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MBmrvFW4pv_B; Fri, 24 Sep 2021 13:18:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C8E5E40650;
	Fri, 24 Sep 2021 13:18:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A67AC001E;
	Fri, 24 Sep 2021 13:18:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19795C000D
 for <iommu@lists.linux-foundation.org>; Fri, 24 Sep 2021 13:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0230606C6
 for <iommu@lists.linux-foundation.org>; Fri, 24 Sep 2021 13:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="38LCLbeP";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="lWWFJgrE"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTB61BfUJZAg for <iommu@lists.linux-foundation.org>;
 Fri, 24 Sep 2021 13:18:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E85B60667
 for <iommu@lists.linux-foundation.org>; Fri, 24 Sep 2021 13:18:16 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1632489492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EkgceDb68aKuyW7Xafy5kre/SZO1C4q0AWs/aSyA1fg=;
 b=38LCLbePDv45bODUZovEnO4nt0pNY7G7jB8ei2tc2xRJ3U6xCgL8Pk7GK2/q1fIk2LE9y1
 5iPxmBzGxqbv9+Szdwp2xLv38MIxT0L/+cEHBwa0ClXSv5S3dndu1wXctu1ziIYzymsc/4
 ug6vEGhBQ+8YZiQbtddsj7OXz2UqAu7W0yfnqqgkl5orPRYXMp8Lpe0kHbexqsRkzmeunw
 RlOIMXcU+BHyBY3k5b1wYDUk++eLgTPPGiK8j/JQ73QFsvbEKsTKB6sNn8eh643c1dcaL2
 85zc79fuqHWPnZpfSPYZO5W78OBQxow9SRiymKhSIydJi51f1kQT/nMdjiU26w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1632489492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EkgceDb68aKuyW7Xafy5kre/SZO1C4q0AWs/aSyA1fg=;
 b=lWWFJgrEx65fA/sjl+oaOFAChukib/QmrFTq4ObEcl9f8EWtFXoZmxOQmcwoY+WqszRrBQ
 gh0Tb6cgy8/N7ZBQ==
To: "Luck, Tony" <tony.luck@intel.com>
Subject: Re: [PATCH 5/8] x86/mmu: Add mm-based PASID refcounting
In-Reply-To: <87o88jfajo.ffs@tglx>
References: <20210920192349.2602141-1-fenghua.yu@intel.com>
 <20210920192349.2602141-6-fenghua.yu@intel.com> <87y27nfjel.ffs@tglx>
 <YUyuEjlrcOeCp4qQ@agluck-desk2.amr.corp.intel.com> <87o88jfajo.ffs@tglx>
Date: Fri, 24 Sep 2021 15:18:12 +0200
Message-ID: <87k0j6dsdn.ffs@tglx>
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Ravi V Shankar <ravi.v.shankar@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, iommu@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, Andy Lutomirski <luto@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>
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

On Thu, Sep 23 2021 at 19:48, Thomas Gleixner wrote:
> On Thu, Sep 23 2021 at 09:40, Tony Luck wrote:
>
> fpu_write_task_pasid() can just grab the pasid from current->mm->pasid
> and be done with it.
>
> The task exit code can just call iommu_pasid_put_task_ref() from the
> generic code and not from within x86.

But OTOH why do you need a per task reference count on the PASID at all?

The PASID is fundamentaly tied to the mm and the mm can't go away before
the threads have gone away unless this magically changed after I checked
that ~20 years ago.

Thanks,

        tglx

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
