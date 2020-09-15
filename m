Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1015426A908
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 17:45:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B8F3B867DA;
	Tue, 15 Sep 2020 15:45:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5coQePCVnMy; Tue, 15 Sep 2020 15:45:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0688B867D7;
	Tue, 15 Sep 2020 15:45:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6A1FC089E;
	Tue, 15 Sep 2020 15:45:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 253B7C0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 15:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 211568723F
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 15:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2WEvlj7DZkjZ for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 15:44:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 19A748723B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 15:44:59 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id o5so4614281qke.12
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Jr9FyPebxkKqG5Q+7PXT2kwXR4HeYkXnIjay9uV7M3A=;
 b=rFHVNAT/L/p+uTassh8kWHyPPmM6zU7jhMji4JUNPpHOH6vp7+SknoNXEUaxITlZJo
 C47l3vrn5M1foQsDyM7MD13TTYbOSoz+k3xxYu2RBF/1DXBmgX5hCizpgqmu7GxO2Qn7
 t+UA0UhrW0z+v7akhpkjQXmNzcd1NdyF9egZIXmLbC6cB5UgKlerScIbcv3AVVTn3Fsc
 SIOsbC7nIY+6OOkvdDsfHVxDKHqeJrx5J2v8OoZnq5BvJ7UDU5nXuKIkPxIn3QTCEXTN
 jo8hO5NeFIqIKE2GyopxS/cZDkUROZKl0oZCNrBm7aRWQrRt7F4pkll8G1GT259vH8V6
 gV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jr9FyPebxkKqG5Q+7PXT2kwXR4HeYkXnIjay9uV7M3A=;
 b=DCwxZieR2/LNV/n5vxpiK+V1DqCGCSAiwjQXDTBrM3T2AanOLqSRkeRcJul3EbrKWI
 gTHbhNPJS9iXO35zirsinsqaLL4mplRRTwLJ4KPv4H+NxmW3AoJOvXi3F1Q48VAFsJ4V
 YbL4caT8caHoYEMuQNuzss+V/UUUIDw1nJFgkwQrv+NMmtelxAtN8SlbUIFlVByujt5w
 DS23ZdiRaUBJKEPtq/ozX4SGgbwmbQ2NS2RqnoOYxCrvYy4eZhgU6r9KYoYf5h3lNCKg
 4YyjhQuzIZNVBT+ZOEDaarCcTmDvhiaBDAcM/1sMgF+uygeFdpBSoAOF9IWikcDnW7Xi
 j/SA==
X-Gm-Message-State: AOAM532LXnkxjRik5nYsFYH2zQAUy9kPXLwTuBk7RmGXQD8UzYU84Xso
 foP+jONwIw+TA85gOyYm1JxMKA==
X-Google-Smtp-Source: ABdhPJy/FgcqpjL803/QUt6DpehETtocnf+0DIjdU+tNjllUdMmC353O7wtD73sn2n4/M/TjNpyT2Q==
X-Received: by 2002:a37:a054:: with SMTP id j81mr17048838qke.23.1600184697935; 
 Tue, 15 Sep 2020 08:44:57 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
 by smtp.gmail.com with ESMTPSA id n136sm15988518qkn.14.2020.09.15.08.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:44:57 -0700 (PDT)
Date: Tue, 15 Sep 2020 15:44:55 +0000
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] irqchip/qcom-pdc: Allow QCOM_PDC to be loadable as a
 permanent module
Message-ID: <20200915154455.GG478@uller>
References: <20200912125148.1271481-7-maz@kernel.org>
 <20200914210423.67579-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914210423.67579-1-john.stultz@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>,
 linux-gpio@vger.kernel.org, iommu@lists.linux-foundation.org,
 Andy Gross <agross@kernel.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Mon 14 Sep 21:04 UTC 2020, John Stultz wrote:

> Allows qcom-pdc driver to be loaded as a permanent module.
> 
> An earlier version of this patch was merged in a larger patchset
> but was reverted entirely when issues were found with other
> drivers, so now that Marc has provided a better solution in his
> Hybrid probing patch set, I wanted to re-submit this change.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/irqchip/Kconfig    | 2 +-
>  drivers/irqchip/qcom-pdc.c | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index bfc9719dbcdc..bb70b7177f94 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -425,7 +425,7 @@ config GOLDFISH_PIC
>           for Goldfish based virtual platforms.
>  
>  config QCOM_PDC
> -	bool "QCOM PDC"
> +	tristate "QCOM PDC"
>  	depends on ARCH_QCOM
>  	select IRQ_DOMAIN_HIERARCHY
>  	help
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 8543fa23da10..59eb3c8473b0 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -433,3 +433,5 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>  IRQCHIP_HYBRID_DRIVER_BEGIN(qcom_pdc)
>  IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
>  IRQCHIP_HYBRID_DRIVER_END(qcom_pdc)
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
