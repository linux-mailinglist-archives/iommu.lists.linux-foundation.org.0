Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DB2F8F28
	for <lists.iommu@lfdr.de>; Tue, 12 Nov 2019 13:01:55 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B645D13C5;
	Tue, 12 Nov 2019 12:01:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 02FCF13A7
	for <iommu@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 12:01:51 +0000 (UTC)
X-Greylist: delayed 00:30:47 by SQLgrey-1.7.6
Received: from inca-roads.misterjones.org (inca-roads.misterjones.org
	[213.251.177.50])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 948ABDF
	for <iommu@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 12:01:50 +0000 (UTC)
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
	(envelope-from <maz@kernel.org>)
	id 1iUUNw-00062q-I5; Tue, 12 Nov 2019 12:31:00 +0100
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/rockchip: Don't provoke WARN for harmless IRQs
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Date: Tue, 12 Nov 2019 12:40:21 +0109
From: Marc Zyngier <maz@kernel.org>
In-Reply-To: <82cba203551939399d219e4cb6c602315fd0c410.1573498518.git.robin.murphy@arm.com>
References: <82cba203551939399d219e4cb6c602315fd0c410.1573498518.git.robin.murphy@arm.com>
Message-ID: <45975bd87e34e9ff6e9656a3235fe074@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: robin.murphy@arm.com, joro@8bytes.org, heiko@sntech.de,
	iommu@lists.linux-foundation.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, anarsoul@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
	SAEximRunCond expanded to false
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
	BUG6152_INVALID_DATE_TZ_ABSURD,INVALID_DATE_TZ_ABSURD autolearn=no
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: heiko@sntech.de, Vasily Khoruzhick <anarsoul@gmail.com>,
	linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 2019-11-11 20:04, Robin Murphy wrote:
> Although we don't generally expect IRQs to fire for a suspended 
> IOMMU,
> there are certain situations (particularly with debug options) where
> we might legitimately end up with the pm_runtime_get_if_in_use() call
> from rk_iommu_irq() returning 0. Since this doesn't represent an 
> actual
> error, follow the other parts of the driver and save the WARN_ON()
> condition for a genuine negative value. Even if we do have spurious
> IRQs due to a wedged VOP asserting the shared line, it's not this
> driver's job to try to second-guess the IRQ core to warn about that.
>
> Reported-by: Vasily Khoruzhick <anarsoul@gmail.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/rockchip-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/rockchip-iommu.c 
> b/drivers/iommu/rockchip-iommu.c
> index 4dcbf68dfda4..bd7e9b1e40ac 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -527,7 +527,7 @@ static irqreturn_t rk_iommu_irq(int irq, void 
> *dev_id)
>  	int i, err;
>
>  	err = pm_runtime_get_if_in_use(iommu->dev);
> -	if (WARN_ON_ONCE(err <= 0))
> +	if (!err || WARN_ON_ONCE(err < 0))
>  		return ret;
>
>  	if (WARN_ON(clk_bulk_enable(iommu->num_clocks, iommu->clocks)))

Acked-by: Marc Zyngier <maz@kernel.org>

         M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
