Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BB022B221
	for <lists.iommu@lfdr.de>; Thu, 23 Jul 2020 17:06:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 43B9E89289;
	Thu, 23 Jul 2020 15:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Pg0F8T32aZC; Thu, 23 Jul 2020 15:05:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8063E892AF;
	Thu, 23 Jul 2020 15:05:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79303C004C;
	Thu, 23 Jul 2020 15:05:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC163C004C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BA37F8665E
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40_RNXTTY9ly for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 15:05:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 11B1C86910
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:05:55 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id by13so4735509edb.11
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 08:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wEZcqIGYqwEOQrL51rqxhyVNs0I0pb8HH3i02KmnnVs=;
 b=QGvAr7eIz2NPXC6cBdK7i4d4trJ+B8qTxmoUzieiiSlZrXgai9Ns3CqIvbPgVyRyeM
 cdLleZcpIONx3HPqg0jUbMKhXfQdSBwn8QSKhagvJZsvNY7wfm6r4d94OB9b+9K1Vg34
 eEvZ7ZLE6F4CN+ytXxD3DQWTWpHOiAnYxm39JZejeV5BAYdQH3qdHCVjQX/Nj/jqlz6H
 DKyI7A8FX2caXOt6PFMVADhmCi+R0icDhxTHcpYS1/gzmbYQpVGksNwVpgMNChxuvxyV
 qq5D+42WF4kKJMxwqarulYrhQGNnMJgJbDpQ9MegJpCG2QU9IPfH5eXs+l55aQGq36gt
 dkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wEZcqIGYqwEOQrL51rqxhyVNs0I0pb8HH3i02KmnnVs=;
 b=mTJUYu+/sphOdM8hAFlsvw6j5sXyCTRvxfhM9xi1+1Qy+h6lw1L0YPQ6m/UTFnRLEK
 VIrbxR1+LO/YlYxFsGsbZyKDWozxTewUNdr1UNkO2c9Z32A0KBj889Xgn4mzmmXnAqU6
 ilrb0NBd+7rvU9EWj8WmvluPsKgrhtXq0/7aPc6dmDq5Q21F3k3G3H+OCqcMFOK9qzJN
 TkiiqsyY7rTjTNof0zH3R414N8c5+9wppEIzFXdt64dwcYbsKU/7yIx27uu1pRLRKWH5
 GL7s2m+9yMNbR91+jeBR8UHumzHxIl1FBTKTuMf9ul5Xj3fNxcnVBqfEKEfA5oTfDnv0
 FEJA==
X-Gm-Message-State: AOAM5304XVKbwDbB8d1RdnxfaOhEj5x7jGYR2aN8qdKstQdwtI5tkHPP
 2DWtY5S/OxK39FRAH8wAA9kseR5tymY=
X-Google-Smtp-Source: ABdhPJx4fNwTfUFLzi/fYdsIJQfH1+RwBv+2YVOyYHLcBTwcTU9qUrY0wiaVlC4MG3drv028RhX/oA==
X-Received: by 2002:a05:6402:158d:: with SMTP id
 c13mr4553675edv.103.1595516753225; 
 Thu, 23 Jul 2020 08:05:53 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id k15sm2145952eji.49.2020.07.23.08.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 08:05:52 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Subject: [PATCH v9 06/13] arm64: cpufeature: Export symbol
 read_sanitised_ftr_reg()
Date: Thu, 23 Jul 2020 16:57:18 +0200
Message-Id: <20200723145724.3014766-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723145724.3014766-1-jean-philippe@linaro.org>
References: <20200723145724.3014766-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: fenghua.yu@intel.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 catalin.marinas@arm.com, Suzuki K Poulose <suzuki.poulose@arm.com>,
 robin.murphy@arm.com, hch@infradead.org, zhengxiang9@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
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

The SMMUv3 driver would like to read the MMFR0 PARANGE field in order to
share CPU page tables with devices. Allow the driver to be built as
module by exporting the read_sanitized_ftr_reg() cpufeature symbol.

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/kernel/cpufeature.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9fae0efc80c1..ac2ed25c43d3 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1068,6 +1068,7 @@ u64 read_sanitised_ftr_reg(u32 id)
 		return 0;
 	return regp->sys_val;
 }
+EXPORT_SYMBOL_GPL(read_sanitised_ftr_reg);
 
 #define read_sysreg_case(r)	\
 	case r:		return read_sysreg_s(r)
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
