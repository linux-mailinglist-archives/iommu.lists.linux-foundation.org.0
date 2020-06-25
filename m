Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DD16C209790
	for <lists.iommu@lfdr.de>; Thu, 25 Jun 2020 02:16:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9418587E65;
	Thu, 25 Jun 2020 00:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 53Nr0PAPAghi; Thu, 25 Jun 2020 00:16:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3443987E45;
	Thu, 25 Jun 2020 00:16:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E030C016F;
	Thu, 25 Jun 2020 00:16:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 000D3C016F
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 00:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EEC5E86B46
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 00:16:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HLvCpZuH4RWD for <iommu@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 00:16:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 42DFB86277
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 00:16:54 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id a21so3426166oic.8
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 17:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qCGYxi6L0dmDdYzHShkkSHiKc6T34aWWoWuQkkFnaWU=;
 b=rOF1YhixiSD8M50+j5CiMzpdohF2arfJt6iyO3UNYlYzhcfBE1/ym4B6dvjJpTZQXZ
 zNVl2oHPobEbAf/+XE2fkhaKapUULh2NUBFuLnvMJpyrqa8xhuu4qGqnVEr92Hp1cXAH
 QQaYRDNL3+IxM2eAoostdDGI9aTtunbnEzAclrm8dcD0BhYaha73Pc10WKlQIrMw4nxg
 75l1QGAhHoBHeSHNEKMgI82S4ZsIAl9YBGDMdZeoKr7tX9q0TN//+8jFTFf9KrKkZQYF
 OuDtsKWUUZAau3d1SAJhBktN2QePVibBmLBb7cygtwzBQmNZ/HXDf1LYhCdnotpzASWL
 PR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qCGYxi6L0dmDdYzHShkkSHiKc6T34aWWoWuQkkFnaWU=;
 b=JX32dUX7ot8g1XUGuspoLKRezUH/icttaCjXpVVta++ery4qG6gNNtFAZg597M/cOy
 zsU8avMET+jC522CaBGkEgPektrbq2a9QnF7YiRJqJDP88fgM10s9OYpv4UCuTbqBXS0
 SjWsAiOjoamN3q3propfh2zeNyDrYnFnFfKeRVmrzygl3A/3mzuLxF3FBG+XN/3aQRDL
 fOHXJG+pEUkIMJehGLD5GOiOT/S/T0pf2IWVYLvo0/MTkTfLSJaZzuhl66VWWvS+ZWZ9
 euWgnCXmcZZXVBYBXWUsxZRudOEk/in5ARsanA6jbzinvRQL7lPJkmhqIe0m7Ly3/mor
 i/fQ==
X-Gm-Message-State: AOAM531uSYsv5F1iX9y/lIbxOqc5Hbl+DdQhWYeRtv4u4QxB0WaW5E1+
 J7ci/IFxNizekb0oE1REK59EnP1XU0Q=
X-Google-Smtp-Source: ABdhPJxGeqEMqjAA50eBDK/+kqthZdDuh3xyYY2kWfjMLxc1bNitFm5ktScRYkrsfEUgv5rN5ZagFQ==
X-Received: by 2002:a17:90a:1781:: with SMTP id q1mr392515pja.8.1593043844977; 
 Wed, 24 Jun 2020 17:10:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 n19sm17458671pgb.0.2020.06.24.17.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 17:10:44 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/5] irq: irqdomain: Export irq_domain_update_bus_token
Date: Thu, 25 Jun 2020 00:10:35 +0000
Message-Id: <20200625001039.56174-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625001039.56174-1-john.stultz@linaro.org>
References: <20200625001039.56174-1-john.stultz@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Lina Iyer <ilina@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-gpio@vger.kernel.org, iommu@lists.linux-foundation.org,
 Andy Gross <agross@kernel.org>, John Stultz <john.stultz@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-msm@vger.kernel.org, Todd Kjos <tkjos@google.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Add export for irq_domain_update_bus_token() so that
we can allow drivers like the qcom-pdc driver to be
loadable as a module.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 kernel/irq/irqdomain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index a4c2c915511d..ca974d965fda 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -281,6 +281,7 @@ void irq_domain_update_bus_token(struct irq_domain *domain,
 
 	mutex_unlock(&irq_domain_mutex);
 }
+EXPORT_SYMBOL_GPL(irq_domain_update_bus_token);
 
 /**
  * irq_domain_add_simple() - Register an irq_domain and optionally map a range of irqs
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
