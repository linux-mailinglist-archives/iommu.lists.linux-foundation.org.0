Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 017621EE771
	for <lists.iommu@lfdr.de>; Thu,  4 Jun 2020 17:13:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B0E0886F50;
	Thu,  4 Jun 2020 15:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BIgLwL7surc4; Thu,  4 Jun 2020 15:13:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 478FB86EEE;
	Thu,  4 Jun 2020 15:13:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 281DFC016E;
	Thu,  4 Jun 2020 15:13:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8D71C016E
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 12:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C7F2888754
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 12:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GmqpQhVAJiCf for <iommu@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 12:37:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EA8C8886B9
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 12:37:17 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id z18so7011258lji.12
 for <iommu@lists.linux-foundation.org>; Thu, 04 Jun 2020 05:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=187fRi3wAGXdsWJGdJdYxiJeP7RT5ffi4VOBDvE3vkA=;
 b=KnMf38a9uubw1WTNSJg8vAWa3P8WOHjJR13Zco84sLKrbNbHlO2CQG6rQ6F07iAF/F
 VeoN1+eEMZOoRlUgqnoU9/pimrekffoJjUkX+odUFr0ADsrJNj+sGReWJgDUMgkK5UQ6
 J/iDF42kRd92dKoBNmn/swGas7eTzIhyKeKL0p9SYjCBDwJy6nKBT+kP2Ip2uBGP/2yO
 +LTDaslSG/6plWfYDqjCvTUzASCPNUysB/eqN3vNAR90GLP+Pp8Y4rK8H9bKFaWAszuW
 l5mJWXsURVnRRvXKaN6ZqIieqk51aKrUGnGNc1pmrohu+32sPdSBYlf108UYGsGxnZTJ
 XSbQ==
X-Gm-Message-State: AOAM533nCnVg6ErvDw8Sp2h4e6HsqqeURWa2Gms5Es1LmrL/nzDdvvfP
 vovjn8OOMWbJyUVxsfVFLpg=
X-Google-Smtp-Source: ABdhPJwzuPhkc8BG3wHPWrXHjUZMF/zoqEJHIwPIOx3lb7BjY9OrlhBokKqh/KwK4rJpea2dTekN3g==
X-Received: by 2002:a2e:9b4b:: with SMTP id o11mr2030133ljj.407.1591274236199; 
 Thu, 04 Jun 2020 05:37:16 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.googlemail.com with ESMTPSA id 15sm1167175ljw.46.2020.06.04.05.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 05:37:15 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH] iommu: fsl_pamu: use kzfree() in fsl_pamu_probe()
Date: Thu,  4 Jun 2020 15:37:09 +0300
Message-Id: <20200604123709.96561-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jun 2020 15:13:12 +0000
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Denis Efremov <efremov@linux.com>
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

Use kzfree() instead of opencoded memset with 0 followed by kfree().
Null check is not required since kzfree() checks for NULL internally.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 drivers/iommu/fsl_pamu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
index cde281b97afa..099a11a35fb9 100644
--- a/drivers/iommu/fsl_pamu.c
+++ b/drivers/iommu/fsl_pamu.c
@@ -1174,10 +1174,7 @@ static int fsl_pamu_probe(struct platform_device *pdev)
 	if (irq != NO_IRQ)
 		free_irq(irq, data);
 
-	if (data) {
-		memset(data, 0, sizeof(struct pamu_isr_data));
-		kfree(data);
-	}
+	kzfree(data);
 
 	if (pamu_regs)
 		iounmap(pamu_regs);
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
