Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E2C269EF4
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 08:56:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1D87586237;
	Tue, 15 Sep 2020 06:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WruKDYAynxJl; Tue, 15 Sep 2020 06:56:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3EAD686214;
	Tue, 15 Sep 2020 06:56:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24A2DC0051;
	Tue, 15 Sep 2020 06:56:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43B9BC0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 06:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 28A5C20491
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 06:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDiN6kZw41k5 for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 06:56:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 5124A20477
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 06:56:43 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35F1F214F1;
 Tue, 15 Sep 2020 06:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600153003;
 bh=skqr9nmrj5gOWqcf3jzuhwSkFXzOKRagbuQYkkpOPIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h3N8YfhmWeI0UbfFLZChBznYbsE9YX3GRDm7tBI0StsTNg6mT5J0UuvfTqvrq0Lmz
 E0VoTX5JwvylLVqKbsOePjirUc77QX6xl/KpjbUh7L/RiAiabkebVrPouO04wDN6VM
 YLgQmyZQjKFqHX0PyAw7DP1xrZGz0OcnLcoCobPE=
Date: Tue, 15 Sep 2020 08:56:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] irqchip/qcom-pdc: Allow QCOM_PDC to be loadable as a
 permanent module
Message-ID: <20200915065630.GE3622460@kroah.com>
References: <20200912125148.1271481-7-maz@kernel.org>
 <20200914210423.67579-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914210423.67579-1-john.stultz@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>,
 linux-gpio@vger.kernel.org, iommu@lists.linux-foundation.org,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 Todd Kjos <tkjos@google.com>
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

On Mon, Sep 14, 2020 at 09:04:23PM +0000, John Stultz wrote:
> Allows qcom-pdc driver to be loaded as a permanent module.
> 
> An earlier version of this patch was merged in a larger patchset
> but was reverted entirely when issues were found with other
> drivers, so now that Marc has provided a better solution in his
> Hybrid probing patch set, I wanted to re-submit this change.
> 
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

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
