Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0185B26BECE
	for <lists.iommu@lfdr.de>; Wed, 16 Sep 2020 10:06:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A37E38732A;
	Wed, 16 Sep 2020 08:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WUge-R6LjwHn; Wed, 16 Sep 2020 08:06:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 445E88732E;
	Wed, 16 Sep 2020 08:06:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25636C0051;
	Wed, 16 Sep 2020 08:06:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CECD2C0051
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 08:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8B507232FA
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 08:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwxSRNn7s22Q for <iommu@lists.linux-foundation.org>;
 Wed, 16 Sep 2020 08:06:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 55ED81FE32
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 08:06:06 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5F1932B0; Wed, 16 Sep 2020 10:06:03 +0200 (CEST)
Date: Wed, 16 Sep 2020 10:06:02 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH v8 0/9] x86: tag application address space for devices
Message-ID: <20200916080510.GA32552@8bytes.org>
References: <1600187413-163670-1-git-send-email-fenghua.yu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600187413-163670-1-git-send-email-fenghua.yu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Ravi V Shankar <ravi.v.shankar@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Dave Hansen <dave.hansen@intel.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Jacob Jun Pan <jacob.jun.pan@intel.com>,
 Andy Lutomirski <luto@kernel.org>, H Peter Anvin <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
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

On Tue, Sep 15, 2020 at 09:30:04AM -0700, Fenghua Yu wrote:
> Ashok Raj (1):
>   Documentation/x86: Add documentation for SVA (Shared Virtual
>     Addressing)
> 
> Fenghua Yu (7):
>   drm, iommu: Change type of pasid to u32
>   iommu/vt-d: Change flags type to unsigned int in binding mm
>   x86/cpufeatures: Enumerate ENQCMD and ENQCMDS instructions
>   x86/msr-index: Define IA32_PASID MSR
>   mm: Define pasid in mm
>   x86/cpufeatures: Mark ENQCMD as disabled when configured out
>   x86/mmu: Allocate/free PASID
> 
> Yu-cheng Yu (1):
>   x86/fpu/xstate: Add supervisor PASID state for ENQCMD feature

For the IOMMU bits:

Acked-by: Joerg Roedel <jroedel@suse.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
