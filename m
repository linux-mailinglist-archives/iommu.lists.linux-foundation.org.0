Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE741D9E71
	for <lists.iommu@lfdr.de>; Tue, 19 May 2020 20:01:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4C3FE87F9B;
	Tue, 19 May 2020 18:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhPGaoV+9YLB; Tue, 19 May 2020 18:01:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8D4DB87863;
	Tue, 19 May 2020 18:01:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83B93C0176;
	Tue, 19 May 2020 18:01:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 310D9C0176
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 71BD38825E
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJqUXuvs+SNq for <iommu@lists.linux-foundation.org>;
 Tue, 19 May 2020 18:01:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6DF808821D
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:01:49 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v12so359571wrp.12
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 11:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wblWsf3gxbDp6PSj/ehcYDd+oP1x7SYe4Bh2SWvMsGw=;
 b=SVXeb2Ob4Qkst7O5mL6UJ2iL9TD8FeQw9vSwN576mogif6BcdDk/DVx3V2M7dI6n21
 cDlB4PgyVw/zWEvawRrLAkk8d7OsM7cAfcUCgb++qPIGOWWFGKIqdCOmLwUmcPpIc1DM
 nP4/NYwjGzU0cZQa1VFg9eXlqA5QFsvshmZ8mLhFDLun84zEb+yVsdQt288r7v2A6o14
 TEfy1o2q/7e8nwZFntyVfD0p19BG2lWIz/U0rwseBJSSfNFTvIJaoIbYbNDXz+jUT31H
 RPGF0E7utbNt/zM+SiQI1i5jIw+y8XFEsPo89fPClJIpEvylAxB4p0fHyzmt/juXQ9nx
 X/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wblWsf3gxbDp6PSj/ehcYDd+oP1x7SYe4Bh2SWvMsGw=;
 b=UEvvSnO8uEXSlYbpoHWJGXZpKR0cAfUORtH76IC0rtHhCjc0NXSMMpIeplbjlE83Hn
 tfvjIZJiLyFk2NAiEpHqJRbXK+6PG8yv/RvyxzDKLUckjlCh3rdDDkhPJ//K21QtV3Jx
 P6Pft4XWyHWn1GPmskD3jyhxPD5+6a4VO2ZCsBxO54RbbT/ey+XMeerlOb7Gq6Yoju+j
 sdeJD+4sTpG4XyGc8xa2BmsUjT4N3CUbeOAZ9zzs/2DPpPrLp2XD76SfUNy80Ej4G3fG
 sXmEnTZJpPWJtVgy/r0wOsPZaAiyOxLbQ5vf7TbxygmrsxooYZQ90/OrlRk3oNBnOJEB
 +B0A==
X-Gm-Message-State: AOAM531HePy2+Tk2FDdeaUZnKQzAymOVxMf9+repCSzR3gIn2g9OqXrW
 On3kh11xBiK3L31O5/06+f9pcvPBlpJCWg==
X-Google-Smtp-Source: ABdhPJwQ7epxyLS6UnZ7f06nlDOMCJUnPMBSTjmWHDJI9x8Mwvumsd4wHmMVikP6f8C+lMs+dd9rLA==
X-Received: by 2002:a5d:6108:: with SMTP id v8mr107787wrt.286.1589911307392;
 Tue, 19 May 2020 11:01:47 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id 1sm510496wmz.13.2020.05.19.11.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 11:01:46 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH v7 05/24] arm64: mm: Add asid_gen_match() helper
Date: Tue, 19 May 2020 19:54:43 +0200
Message-Id: <20200519175502.2504091-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519175502.2504091-1-jean-philippe@linaro.org>
References: <20200519175502.2504091-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: fenghua.yu@intel.com, kevin.tian@intel.com, jgg@ziepe.ca,
 catalin.marinas@arm.com, robin.murphy@arm.com, hch@infradead.org,
 zhangfei.gao@linaro.org, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 felix.kuehling@amd.com, will@kernel.org, christian.koenig@amd.com
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

Add a macro to check if an ASID is from the current generation, since a
subsequent patch will introduce a third user for this test.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/mm/context.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 9b26f9a88724..d702d60e64da 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -92,6 +92,9 @@ static void set_reserved_asid_bits(void)
 		bitmap_clear(asid_map, 0, NUM_USER_ASIDS);
 }
 
+#define asid_gen_match(asid) \
+	(!(((asid) ^ atomic64_read(&asid_generation)) >> asid_bits))
+
 static void flush_context(void)
 {
 	int i;
@@ -220,8 +223,7 @@ void check_and_switch_context(struct mm_struct *mm, unsigned int cpu)
 	 *   because atomic RmWs are totally ordered for a given location.
 	 */
 	old_active_asid = atomic64_read(&per_cpu(active_asids, cpu));
-	if (old_active_asid &&
-	    !((asid ^ atomic64_read(&asid_generation)) >> asid_bits) &&
+	if (old_active_asid && asid_gen_match(asid) &&
 	    atomic64_cmpxchg_relaxed(&per_cpu(active_asids, cpu),
 				     old_active_asid, asid))
 		goto switch_mm_fastpath;
@@ -229,7 +231,7 @@ void check_and_switch_context(struct mm_struct *mm, unsigned int cpu)
 	raw_spin_lock_irqsave(&cpu_asid_lock, flags);
 	/* Check that our ASID belongs to the current generation. */
 	asid = atomic64_read(&mm->context.id);
-	if ((asid ^ atomic64_read(&asid_generation)) >> asid_bits) {
+	if (!asid_gen_match(asid)) {
 		asid = new_context(mm);
 		atomic64_set(&mm->context.id, asid);
 	}
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
