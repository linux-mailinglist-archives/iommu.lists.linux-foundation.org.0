Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D64AA3F7
	for <lists.iommu@lfdr.de>; Sat,  5 Feb 2022 00:07:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C65A829DB;
	Fri,  4 Feb 2022 23:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wiNCyXEbGfRK; Fri,  4 Feb 2022 23:07:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C072482786;
	Fri,  4 Feb 2022 23:07:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 893C8C000B;
	Fri,  4 Feb 2022 23:07:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28FCCC000B
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 23:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1040482786
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 23:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EK2pZ_kDHxhE for <iommu@lists.linux-foundation.org>;
 Fri,  4 Feb 2022 23:07:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DC9882735
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 23:07:35 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1644016051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XnhUMmuoy3H9frjewzOP3Ywq/q0qdsbrKJfw5nT/m5k=;
 b=SOrHnXVoPsmninpWXs7KWSnkzSfHvmZT2/Qwp8SQ3LJmhoagnYkNopDitPTiZBx8bJwzVi
 +L1A/Vp7e7jWLVYl5g9q/jBz6Q+WZHHiHLf7Divdgh2F5TyEIzwu0A+DPO/VJ+cyuht2BR
 OgyOeL+yHiTAUkOEk2ICFehbrKjMRT+ZALsXd7KOUDEts30nnEbRJNYWqz9MAOeqgmFG6z
 1WvGc99mVt2WBauUhR3n1hiejdO3dj6xITEQuIcSrEfH1dS1etlSJ3uwStNURXbAvqblWg
 vqFPJYVcB4KzDlpksC7k43DS4KHUUKTz7sUFNR5et46bJWzOsQXnPQx4fX5lbw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1644016051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XnhUMmuoy3H9frjewzOP3Ywq/q0qdsbrKJfw5nT/m5k=;
 b=Z8NUF1bglArTaYD5uZz98QaGYAItoaStikcyQYz06YFqKMk5g9zors8SaVtMR3Z66WKb5q
 oYmW4denlK0mMXBg==
To: Fenghua Yu <fenghua.yu@intel.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy
 Lutomirski <luto@kernel.org>, Tony Luck <tony.luck@intel.com>, Lu Baolu
 <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, Ashok
 Raj <ashok.raj@intel.com>, Ravi V Shankar <ravi.v.shankar@intel.com>
Subject: Re: [PATCH v3 01/11] iommu/sva: Rename CONFIG_IOMMU_SVA_LIB to
 CONFIG_IOMMU_SVA
In-Reply-To: <20220128202905.2274672-2-fenghua.yu@intel.com>
References: <20220128202905.2274672-1-fenghua.yu@intel.com>
 <20220128202905.2274672-2-fenghua.yu@intel.com>
Date: Sat, 05 Feb 2022 00:07:31 +0100
Message-ID: <877daacjt8.ffs@tglx>
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, iommu@lists.linux-foundation.org,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
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

On Fri, Jan 28 2022 at 12:28, Fenghua Yu wrote:

> This CONFIG option originally only referred to the Shared
> Virtual Address (SVA) library. But it is now also used for
> non-library portions of code.
>
> Drop the "_LIB" suffix so that there is just one configuration
> options for all code relating to SVA.
>
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
