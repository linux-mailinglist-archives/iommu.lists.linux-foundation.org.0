Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F3D246DF3
	for <lists.iommu@lfdr.de>; Mon, 17 Aug 2020 19:18:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D57A42052E;
	Mon, 17 Aug 2020 17:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQ0Gn0Z4aqEq; Mon, 17 Aug 2020 17:18:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 867AA20474;
	Mon, 17 Aug 2020 17:18:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69EE9C088E;
	Mon, 17 Aug 2020 17:18:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF125C07FF
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 17:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EB7B887A43
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 17:18:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0JbeuI4SLSfg for <iommu@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 17:18:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3E25B87A52
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 17:18:37 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id df16so12905580edb.9
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 10:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xAI4tW8Sd4qwo2LwzvQq9a4HDeBi7JUGf6WbxKMhMtc=;
 b=HdY3UMpsIG6P36/EZPxC5TOek26U3SzSg5oCDHf7GXV4MG1fcY2+0w7JjDSCM/riWM
 8NgRT4R5DmKniz/jbgzsm+ayvm9lx6r8nIjij+ZEfLKZhkCU2seNP1hcdHHs8IKaFxPW
 wlB15OgrU0MTruCv6Xsp6OsTtaYbM7pmuZEaWU4p4/IeRYlg4SF95lcSMet2x0dWYaea
 xl8lvA12VneRBGrOFd18Sr5BkI+4Y41vDB2aeoSp4SJPgH8/A9T6IphzMD5Q7h5xEZRN
 lwq8/5qDALP+AlegMr3+EDpDBNDCMeUksBf8GOgLKxDaDqdkqY9aoi0gtQKlsuIVCWTx
 soJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xAI4tW8Sd4qwo2LwzvQq9a4HDeBi7JUGf6WbxKMhMtc=;
 b=JqUclC3CzzR2dHtoFTNhgpyfjBWLq/627l0+c4Nq9T5ijNmNm2kMagQBoI6QJQlXDA
 HdhK/P8u6sKyplKAFTelqT1SzrvFYJBEFsKC6KWn2fd76Kk67lDbszmy5WMt94AFGZUf
 QDhw3d9iwqai9frAue1TFphl55RqQ1a7XiPyYjzYDMR93T6wNWQ/mNbs1F2xZE4wH1Ty
 uOyLHvsh+mK7utADG/KAlwOlKYQPyv1QEf7OJyYnslNdUqwBa3UFjNuADFx2SwIGSQOP
 rQtriETQ7jQsUG8nl1KcZOD4Am+mjoxeEZpT4KXJfCb/e9VSRgb3n/MXWAD7YgkG0/8e
 hMnQ==
X-Gm-Message-State: AOAM531Aj7YpehmI2kwBYVzLKmF69dpqrQ8Ejo0TeSATRmSEt1QhQeLH
 IqIDDtPIn1ZcSD4A8OoANLoVKS0tRCzeElX2
X-Google-Smtp-Source: ABdhPJyP5Y5MpD0YB8+dyaifXxCyKDE5gN7qRt1wotAqYWR1y6+qzi5cQp7FPsY/uvIqK+78YHkUxA==
X-Received: by 2002:aa7:dd94:: with SMTP id g20mr15446073edv.238.1597684715386; 
 Mon, 17 Aug 2020 10:18:35 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id lc18sm14672502ejb.29.2020.08.17.10.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 10:18:34 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Subject: [PATCH RESEND v9 06/13] arm64: cpufeature: Export symbol
 read_sanitised_ftr_reg()
Date: Mon, 17 Aug 2020 19:15:52 +0200
Message-Id: <20200817171558.325917-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817171558.325917-1-jean-philippe@linaro.org>
References: <20200817171558.325917-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: fenghua.yu@intel.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 catalin.marinas@arm.com, Suzuki K Poulose <suzuki.poulose@arm.com>,
 robin.murphy@arm.com, zhengxiang9@huawei.com, zhangfei.gao@linaro.org,
 will@kernel.org
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
index a389b999482e..c53666a47e1d 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1111,6 +1111,7 @@ u64 read_sanitised_ftr_reg(u32 id)
 		return 0;
 	return regp->sys_val;
 }
+EXPORT_SYMBOL_GPL(read_sanitised_ftr_reg);
 
 #define read_sysreg_case(r)	\
 	case r:		return read_sysreg_s(r)
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
