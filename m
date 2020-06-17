Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D75D71FD578
	for <lists.iommu@lfdr.de>; Wed, 17 Jun 2020 21:35:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 741F68809E;
	Wed, 17 Jun 2020 19:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tD7wRZkOysAW; Wed, 17 Jun 2020 19:35:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C4E4987FEE;
	Wed, 17 Jun 2020 19:35:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA254C016E;
	Wed, 17 Jun 2020 19:35:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D05EC016E
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 19:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5469687E7D
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 19:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1aDPwyyfUtxk for <iommu@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 19:35:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EB5D387E35
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 19:35:24 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F6D021883
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 19:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592422524;
 bh=kj0CVUWmj6brL8f0EF5vkVooJfxv+yYMAPz+jZjllkU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=agqnsRa/EK56lzeAqjMVgQ1zbGyGoA2svGW8UU92BMH5riL2IDrqXSl30601Let+T
 Fd8XkVT/VcRME6B1M/dEiFsPsHxNWMLiZjMBzMAVNrUqFSFOmUu+FZ/lEU2FxhFz1O
 X6HuTjdQFU2wcbM7p0A8xL+cYsaejBnp+778vd3I=
Received: by mail-wm1-f54.google.com with SMTP id l26so2979980wme.3
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 12:35:24 -0700 (PDT)
X-Gm-Message-State: AOAM531pKriUEUkKtm1gq1mM7e8QBAoa4sD67BAscl/LEUBguG4eclKV
 JfabZz2B2xtSsW/LjuRfzMSRUMxNMicT3/iMDoTAHQ==
X-Google-Smtp-Source: ABdhPJwZufrSC0HSDHfM4LNl3upPjFIP57rAsb579ve9INcvPBLnanr6p4UckI+Bo36Vg5i5NBiwIO759HWAx17PmDw=
X-Received: by 2002:a1c:4804:: with SMTP id v4mr294927wma.21.1592422522886;
 Wed, 17 Jun 2020 12:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <1592418233-17762-1-git-send-email-fenghua.yu@intel.com>
 <1592418233-17762-2-git-send-email-fenghua.yu@intel.com>
In-Reply-To: <1592418233-17762-2-git-send-email-fenghua.yu@intel.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Wed, 17 Jun 2020 12:35:11 -0700
X-Gmail-Original-Message-ID: <CALCETrXFHa_05-sGAy5M9YGJWUfTn9MfM-ZYk+hp12tqHNJA0Q@mail.gmail.com>
Message-ID: <CALCETrXFHa_05-sGAy5M9YGJWUfTn9MfM-ZYk+hp12tqHNJA0Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] iommu: Change type of pasid to unsigned int
To: Fenghua Yu <fenghua.yu@intel.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Ravi V Shankar <ravi.v.shankar@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, iommu <iommu@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, H Peter Anvin <hpa@zytor.com>,
 Christoph Hellwig <hch@infradeed.org>, Thomas Gleixner <tglx@linutronix.de>,
 David Woodhouse <dwmw2@infradead.org>
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

On Wed, Jun 17, 2020 at 11:24 AM Fenghua Yu <fenghua.yu@intel.com> wrote:
>
> PASID is defined as a few different types in iommu including "int",
> "u32", and "unsigned int". To be consistent and to match with ioasid's
> type, define PASID and its variations (e.g. max PASID) as "unsigned int".
>
> No PASID type change in uapi.

Is PASID in the uapi at all?

--Andy
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
