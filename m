Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D97331B3
	for <lists.iommu@lfdr.de>; Mon,  3 Jun 2019 16:05:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 79BEADE0;
	Mon,  3 Jun 2019 14:05:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8753BC58
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 14:05:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 15A67854
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 14:05:31 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id a27so454495qkk.5
	for <iommu@lists.linux-foundation.org>;
	Mon, 03 Jun 2019 07:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=nF9cQpios6fXc6OzV7zmvzF2+NBva4iLFuGACokhWRE=;
	b=N9Pr2jYVC3j5RXnC1lhMMCOGdLeidx0t4kajq30mmGwS9UFw32IWw17K5OUeYwy/Z4
	ImpgBtW72k5AIKHNDm3VsibxjC/QObuVKP4jLT3j9hs11/kYKHfQQKCUAYIP91yS7mSc
	cUbs6kRFMGTHe115Nd1uObdfmQzco1YLOfiNKpac64pOTcYtIBoPyMp7s4YVK4pAbMER
	MLt3DIseH7ilx6DjDpc7HXZ8L8Xl6fXTVNH3IbPrm7DGcftz67uPHF/FT2IuvsTYpSdS
	Gz7KAkhG8CHp+NBnRAyGOqHtHEM8qsnegoWqEkNm08xPpmLsdEom8WxE5RQ8FwbtqX/F
	4osQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nF9cQpios6fXc6OzV7zmvzF2+NBva4iLFuGACokhWRE=;
	b=CFmM2iF6uXpXeQXcrwwn02leS2f9idojJ6YIQcelPoSLAB77BmDnvOszFkYo/0vFs2
	b3lm2T+f6o3l/WUHnn0VZABiFMMd7MuZ5cHCb32sgtPS6GlERPZSvRmjSGNyYDGmceBW
	dt1E+LaznqtRS9tUgujmXf7rgoqOkAm2m7jji6NGVKYlChJxF1HY5DLRE8qaT9AVSX1t
	9C2RohdzdLbBDyiZ8PDypXAw24j6/N1ePneEnVcJV9RWbx1TIgtutExoww0y3NR2cEqh
	GNN6It/Zm5grkqhKveLYR0p8b2imcAasAkXq3QxAj+V01PXxo/pYxcl1gcY412wS1HAe
	jYsA==
X-Gm-Message-State: APjAAAWVtJmbHk8iiuqolnz5ekXbmLZCYdlW1lmqncRcaEkwyZH/ZxbI
	O7IO+dXgTKNs5xtxJkfHGj0yQQ==
X-Google-Smtp-Source: APXvYqwvA7+/eTZv71B8hBFS5QTuc/mvZOV2BnCVsIwXN90jHz1i5jWNRPBpMFNl755BiaI33dSSGw==
X-Received: by 2002:ae9:d601:: with SMTP id r1mr22357556qkk.231.1559570731086; 
	Mon, 03 Jun 2019 07:05:31 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id f9sm9310878qkb.97.2019.06.03.07.05.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jun 2019 07:05:30 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: jroedel@suse.de
Subject: [PATCH -next] iommu/intel: silence a variable set but not used
Date: Mon,  3 Jun 2019 10:05:19 -0400
Message-Id: <1559570719-16285-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Qian Cai <cai@lca.pw>, iommu@lists.linux-foundation.org,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

The commit "iommu/vt-d: Probe DMA-capable ACPI name space devices"
introduced a compilation warning due to the "iommu" variable in
for_each_active_iommu() but never used the for each element, i.e,
"drhd->iommu".

drivers/iommu/intel-iommu.c: In function 'probe_acpi_namespace_devices':
drivers/iommu/intel-iommu.c:4639:22: warning: variable 'iommu' set but
not used [-Wunused-but-set-variable]
  struct intel_iommu *iommu;

Silence the warning the same way as in the commit d3ed71e5cc50
("drivers/iommu/intel-iommu.c: fix variable 'iommu' set but not used")

Signed-off-by: Qian Cai <cai@lca.pw>
---
 drivers/iommu/intel-iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index b431cc6f6ba4..2897354a341a 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -4636,7 +4636,8 @@ static int __init platform_optin_force_iommu(void)
 static int __init probe_acpi_namespace_devices(void)
 {
 	struct dmar_drhd_unit *drhd;
-	struct intel_iommu *iommu;
+	/* To avoid a -Wunused-but-set-variable warning. */
+	struct intel_iommu *iommu __maybe_unused;
 	struct device *dev;
 	int i, ret = 0;
 
-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
