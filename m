Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9E11FBC57
	for <lists.iommu@lfdr.de>; Tue, 16 Jun 2020 19:05:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C3EA489609;
	Tue, 16 Jun 2020 17:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dj3oOhxEhgtp; Tue, 16 Jun 2020 17:05:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 21A10895EC;
	Tue, 16 Jun 2020 17:05:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05B41C016E;
	Tue, 16 Jun 2020 17:05:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1576AC016E
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 16:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F252C87973
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 16:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id czi_0AP8TpOl for <iommu@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 16:08:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E3B5C864D0
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 16:08:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1592323713; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=MD92WfPRgR/jkFLJAG2o5YhCjEHFWsLDGTiEaMXk+O4=;
 b=FkOCg3jrSoeEwwXkjdDSYpYEXJqQ5jRWYeY57st2azLsMsgFzpk1yeygtEotOCcgB3o1pnW4
 H37EJUyfXBkd6FL/Mqb8VinjtH43qj4Ffju599sXmviTfM7ypt2PDuiY7GMp7pvOVMdOCLfL
 +PpO5BeAArou7ABtRXy84sQR0jk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5ee8ee75356bcc26ab0ffc16 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Jun 2020 16:08:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D5CECC4339C; Tue, 16 Jun 2020 16:08:20 +0000 (UTC)
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ilina)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2594BC433CA;
 Tue, 16 Jun 2020 16:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2594BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ilina@codeaurora.org
Date: Tue, 16 Jun 2020 10:08:18 -0600
From: Lina Iyer <ilina@codeaurora.org>
To: Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [RFC][PATCH 3/5] irqchip: Allow QCOM_PDC to be loadable as a
 perment module
Message-ID: <20200616160818.GD12942@codeaurora.org>
References: <20200616061338.109499-1-john.stultz@linaro.org>
 <20200616061338.109499-4-john.stultz@linaro.org>
 <55e5982a-1e73-7013-e02d-5d1d30815fba@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55e5982a-1e73-7013-e02d-5d1d30815fba@codeaurora.org>
X-Mailman-Approved-At: Tue, 16 Jun 2020 17:05:39 +0000
Cc: Jason Cooper <jason@lakedaemon.net>, Saravana Kannan <saravanak@google.com>,
 Marc Zyngier <maz@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org,
 iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
 John Stultz <john.stultz@linaro.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Jun 16 2020 at 05:30 -0600, Maulik Shah wrote:
>Hi,
>
>On 6/16/2020 11:43 AM, John Stultz wrote:
>>Allows qcom-pdc driver to be loaded as a permenent module
>
>typo: permanent
>
>>Also, due to the fact that IRQCHIP_DECLARE becomes a no-op when
>>building as a module, we have to add the platform driver hooks
>>explicitly.
>>
>>Thanks to Saravana for his help on pointing out the
>>IRQCHIP_DECLARE issue and guidance on a solution.
>>
>>Cc: Andy Gross <agross@kernel.org>
>>Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>>Cc: Joerg Roedel <joro@8bytes.org>
>>Cc: Thomas Gleixner <tglx@linutronix.de>
>>Cc: Jason Cooper <jason@lakedaemon.net>
>>Cc: Marc Zyngier <maz@kernel.org>
>>Cc: Linus Walleij <linus.walleij@linaro.org>
>>Cc: Lina Iyer <ilina@codeaurora.org>
>>Cc: Saravana Kannan <saravanak@google.com>
>>Cc: Todd Kjos <tkjos@google.com>
>>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>Cc: linux-arm-msm@vger.kernel.org
>>Cc: iommu@lists.linux-foundation.org
>>Cc: linux-gpio@vger.kernel.org
>>Signed-off-by: John Stultz <john.stultz@linaro.org>
>>---
>>  drivers/irqchip/Kconfig    |  2 +-
>>  drivers/irqchip/qcom-pdc.c | 30 ++++++++++++++++++++++++++++++
>>  2 files changed, 31 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>>index 29fead208cad..12765bed08f9 100644
>>--- a/drivers/irqchip/Kconfig
>>+++ b/drivers/irqchip/Kconfig
>>@@ -425,7 +425,7 @@ config GOLDFISH_PIC
>>           for Goldfish based virtual platforms.
>>  config QCOM_PDC
>>-	bool "QCOM PDC"
>>+	tristate "QCOM PDC"
>>  	depends on ARCH_QCOM
>>  	select IRQ_DOMAIN_HIERARCHY
>>  	help
>>diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>>index 6ae9e1f0819d..98d74160afcd 100644
>>--- a/drivers/irqchip/qcom-pdc.c
>>+++ b/drivers/irqchip/qcom-pdc.c
>>@@ -11,7 +11,9 @@
>>  #include <linux/irqdomain.h>
>>  #include <linux/io.h>
>>  #include <linux/kernel.h>
>>+#include <linux/module.h>
>>  #include <linux/of.h>
>>+#include <linux/of_irq.h>
>please move this include in order after of_device.h
>>  #include <linux/of_address.h>
>>  #include <linux/of_device.h>
>>  #include <linux/soc/qcom/irq.h>
>>@@ -430,4 +432,32 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>>  	return ret;
>>  }
>>+#ifdef MODULE
>>+static int qcom_pdc_probe(struct platform_device *pdev)
>>+{
>>+	struct device_node *np = pdev->dev.of_node;
>>+	struct device_node *parent = of_irq_find_parent(np);
>>+
>>+	return qcom_pdc_init(np, parent);
>>+}
>>+
>>+static const struct of_device_id qcom_pdc_match_table[] = {
>>+	{ .compatible = "qcom,pdc" },
>>+	{}
>>+};
>>+MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
>>+
>>+static struct platform_driver qcom_pdc_driver = {
>>+	.probe = qcom_pdc_probe,
>>+	.driver = {
>>+		.name = "qcom-pdc",
>>+		.of_match_table = qcom_pdc_match_table,
>
>can you please set .suppress_bind_attrs = true,
>
>This is to prevent bind/unbind using sysfs. Once irqchip driver module 
>is loaded, it shouldn't get unbind at runtime.
>
That is a good point. We probably should do that to RPMH RSC driver as well.

>Thanks,
>Maulik
>>+	},
>>+};
>>+module_platform_driver(qcom_pdc_driver);
>>+#else
>>  IRQCHIP_DECLARE(qcom_pdc, "qcom,pdc", qcom_pdc_init);
>>+#endif
>>+
>>+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
>>+MODULE_LICENSE("GPL v2");
>
>-- 
>QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
