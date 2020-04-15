Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE9E1A8F77
	for <lists.iommu@lfdr.de>; Wed, 15 Apr 2020 02:05:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E475B86B94;
	Wed, 15 Apr 2020 00:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7I6-FqZh-txq; Wed, 15 Apr 2020 00:05:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7AA5286CC5;
	Wed, 15 Apr 2020 00:05:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6834BC0172;
	Wed, 15 Apr 2020 00:05:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8D91C0172
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 00:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 861AE87E74
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 00:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rDtpC8GO+1DF for <iommu@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 00:05:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0086087E60
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 00:05:02 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t4so565773plq.12
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 17:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=KR6uSQVGwCyM0LnuYfYFDEMfJVon1ni6IuCovgn4/s0=;
 b=rqKtzwFZVZWUOiIrgJExufYVXu3Tq6MqN9fZu+ZH2YWZFYDd36z9cKaQb1z64mO7tH
 MqHd3c/DVdGpEppY6hDK2NUcvYFc9GB0boflgmYFjwRnXpj7C88Raa2vtIKHZltPbaZY
 Yq4XjmwAMnLhc5OAOpmyCEprZER5wgs9TG0NXMxxpAvZslYPLWReI9hEIrUglD3v33nE
 uvdcK2H6ZpBcTwk6YibzffwOAU+UcafvBxlbh/n+dtdh5ojeU1wXawqu+7tuuraTSg2r
 hAMC56p50b97myh5kSGVE5o5KJpXUH8ugjcM1X8zg5XSTobhilOhGVEwO0sF61kP7SMB
 57ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=KR6uSQVGwCyM0LnuYfYFDEMfJVon1ni6IuCovgn4/s0=;
 b=O+8y/q4GHFn5Dka/eMrksptiuQCGTsEh5tBArObycqqwYAZMEGR4B9TLuYQR3kjJ84
 WAYsBpmvXPqlJSsJLzIzSzb24zH8tVPOmhzFzxXu1NAsxjCT03ADZfI6QH8cX1shKxen
 jCxabOdF1mxT+LktQacH4q770vaOCRM9NW1Fmduo/JgGkJCBcNIMi+arDc7KWyQgsPCW
 bGnT85EcQi4R1Q5zMPI9N983/UmYytMeXcnWHbv4dMRnGsnS13ivYRVj/Gr9SzkpbU/4
 BjOyheM0eKxXXj22zjW7vDH1ocqgByj1UkKDBfuLbqU0dJM3obs6WEjVmoOtiVy97Oj/
 u38g==
X-Gm-Message-State: AGi0PubgeQiAZn4ugHPy0/vlD04JIsNa+055GQXM4moGejN+k6PT4iBj
 2Vx1RYHACG+QGB5dQKPJM0o5cg==
X-Google-Smtp-Source: APiQypITsrLE30A4dNLnVHx0jF/AXyPl+UHgHDtx9Gu90EvJXODyZih95z0Ar2V67vHkb70mSHKTvg==
X-Received: by 2002:a17:90a:22e9:: with SMTP id
 s96mr2911139pjc.46.1586909102385; 
 Tue, 14 Apr 2020 17:05:02 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id z7sm7286945pfz.216.2020.04.14.17.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 17:05:01 -0700 (PDT)
Date: Tue, 14 Apr 2020 17:05:01 -0700 (PDT)
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Christoph Hellwig <hch@lst.de>, Tom Lendacky <thomas.lendacky@amd.com>
Subject: [patch 6/7] x86/mm: unencrypted non-blocking DMA allocations use
 coherent pools
In-Reply-To: <alpine.DEB.2.22.394.2004141700480.68516@chino.kir.corp.google.com>
Message-ID: <alpine.DEB.2.22.394.2004141704190.68516@chino.kir.corp.google.com>
References: <alpine.DEB.2.22.394.2004141700480.68516@chino.kir.corp.google.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Cc: x86@kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 Jon Grimm <jon.grimm@amd.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>
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
From: David Rientjes via iommu <iommu@lists.linux-foundation.org>
Reply-To: David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

When CONFIG_AMD_MEM_ENCRYPT is enabled and a device requires unencrypted
DMA, all non-blocking allocations must originate from the atomic DMA
coherent pools.

Select CONFIG_DMA_COHERENT_POOL for CONFIG_AMD_MEM_ENCRYPT.

Signed-off-by: David Rientjes <rientjes@google.com>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 1d6104ea8af0..2bf2222819d3 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1520,6 +1520,7 @@ config X86_CPA_STATISTICS
 config AMD_MEM_ENCRYPT
 	bool "AMD Secure Memory Encryption (SME) support"
 	depends on X86_64 && CPU_SUP_AMD
+	select DMA_COHERENT_POOL
 	select DYNAMIC_PHYSICAL_MASK
 	select ARCH_USE_MEMREMAP_PROT
 	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
