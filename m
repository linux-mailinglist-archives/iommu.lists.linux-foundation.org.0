Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EE61420AF2D
	for <lists.iommu@lfdr.de>; Fri, 26 Jun 2020 11:45:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A2E0787D51;
	Fri, 26 Jun 2020 09:45:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id csg47fgTci63; Fri, 26 Jun 2020 09:45:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 069C487D46;
	Fri, 26 Jun 2020 09:45:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0B49C016F;
	Fri, 26 Jun 2020 09:45:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AA40C016F
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 09:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7F487226E5
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 09:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKWnf-AFTXV7 for <iommu@lists.linux-foundation.org>;
 Fri, 26 Jun 2020 09:45:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by silver.osuosl.org (Postfix) with ESMTPS id A6182221DC
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oGMIMXlIlCUxBQEVDocoCkzxsIEfyIRY9Aj5R1plPtE=; b=Sknfyfor34r7Xi+MJY/BouCu0w
 ZL1fVw+zVjAajorw4AsXlSKf6jdNN25PoEwzEber3uWmJpXVYlIB1dAH+YVpK/xFH63MhHtio1Qlg
 qt83BqUDObvW/PVxquYsBNzUtP1HPEPt2800r/lBYLe4hBJ9FHOHltb7bzYDXQ17v0nWHNDYOiQ+g
 8enV6WQqgeFxiHfWNfA3z1NI1QMiD9RPXTNDxrXMRHVp0LfdCZeJDf3ZbUC2kH/cxIh6a1lMRdgpG
 7DM1L2MF7W6RSMtG96vjQqfklke50DR25+fLPQ6d4+qkfclyRkFdw+nZlxc6k1CJpZZ+kJh96aVok
 Qa04xpzw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jokui-0000wC-M1; Fri, 26 Jun 2020 09:44:52 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3B76A301A32;
 Fri, 26 Jun 2020 11:44:50 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2D6F529AD694F; Fri, 26 Jun 2020 11:44:50 +0200 (CEST)
Date: Fri, 26 Jun 2020 11:44:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH v4 12/12] x86/traps: Fix up invalid PASID
Message-ID: <20200626094450.GJ4800@hirez.programming.kicks-ass.net>
References: <1593116242-31507-1-git-send-email-fenghua.yu@intel.com>
 <1593116242-31507-13-git-send-email-fenghua.yu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593116242-31507-13-git-send-email-fenghua.yu@intel.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Ravi V Shankar <ravi.v.shankar@intel.com>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, iommu@lists.linux-foundation.org,
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

On Thu, Jun 25, 2020 at 01:17:22PM -0700, Fenghua Yu wrote:

> +static bool fixup_pasid_exception(void)
> +{
> +	if (!IS_ENABLED(CONFIG_INTEL_IOMMU_SVM))
> +		return false;
> +	if (!static_cpu_has(X86_FEATURE_ENQCMD))
> +		return false;

elsewhere you had another variation:

+       if (!IS_ENABLED(CONFIG_INTEL_IOMMU_SVM))
+               return;
+
+       if (!cpu_feature_enabled(X86_FEATURE_ENQCMD))
+               return;

Which is it, and why do we need the CONFIG thing when combined with the
enabled thing?

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
