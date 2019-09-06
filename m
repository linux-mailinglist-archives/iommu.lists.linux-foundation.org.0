Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9362AABC45
	for <lists.iommu@lfdr.de>; Fri,  6 Sep 2019 17:24:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 33BD81651;
	Fri,  6 Sep 2019 15:24:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2092915BE
	for <iommu@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 15:24:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9B07A756
	for <iommu@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 15:24:29 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x86FOLWJ098120;
	Fri, 6 Sep 2019 10:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567783461;
	bh=gVipEgoxrF27DsHGbInXS36lsJpOtNNkdk6SgXikS5k=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=mPrzJ9MMOKQiSbr5BfacTf0AU7NQs/27P5s2ZRYa/4hcc9y7atf0wbKOncIvwpNYE
	s/QZ8fBvyAVRR1R8kP3VS5HMFEJnVLiOByu3xcKoIpkCHaK0VmKmVp71XFBvJcctFB
	HPG09dKcYuOoRPrCRcp0aY5KBfTtEugcu/kDtEXc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x86FOLrm000639
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Sep 2019 10:24:21 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 6 Sep 2019 10:24:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 6 Sep 2019 10:24:19 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x86FOJgV033402;
	Fri, 6 Sep 2019 10:24:19 -0500
Subject: Re: [PATCH] iommu: omap: mark pm functions __maybe_unused
To: Arnd Bergmann <arnd@arndb.de>, Joerg Roedel <joro@8bytes.org>
References: <20190906151551.1192788-1-arnd@arndb.de>
Message-ID: <20150686-f14c-389b-7345-699cee191116@ti.com>
Date: Fri, 6 Sep 2019 10:24:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190906151551.1192788-1-arnd@arndb.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tero Kristo <t-kristo@ti.com>, iommu@lists.linux-foundation.org,
	Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
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
From: Suman Anna via iommu <iommu@lists.linux-foundation.org>
Reply-To: Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Arnd,

On 9/6/19 10:15 AM, Arnd Bergmann wrote:
> The runtime_pm functions are unused when CONFIG_PM is disabled:
> 
> drivers/iommu/omap-iommu.c:1022:12: error: unused function 'omap_iommu_runtime_suspend' [-Werror,-Wunused-function]
> static int omap_iommu_runtime_suspend(struct device *dev)
> drivers/iommu/omap-iommu.c:1064:12: error: unused function 'omap_iommu_runtime_resume' [-Werror,-Wunused-function]
> static int omap_iommu_runtime_resume(struct device *dev)
> 
> Mark them as __maybe_unused to let gcc silently drop them
> instead of warning.

Curious, what defconfig is this? OMAP drivers won't be functional in
general without pm_runtime, so CONFIG_PM is mandatory. But from just a
CONFIG_PM option point of view, agree with the patch.

> 
> Fixes: db8918f61d51 ("iommu/omap: streamline enable/disable through runtime pm callbacks")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Suman Anna <s-anna@ti.com>

> ---
>  drivers/iommu/omap-iommu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index 451e3c98ab2d..09c6e1c680db 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1019,7 +1019,7 @@ EXPORT_SYMBOL_GPL(omap_iommu_domain_activate);
>   * reset line. This function also saves the context of any
>   * locked TLBs if suspending.
>   **/
> -static int omap_iommu_runtime_suspend(struct device *dev)
> +static __maybe_unused int omap_iommu_runtime_suspend(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct iommu_platform_data *pdata = dev_get_platdata(dev);
> @@ -1061,7 +1061,7 @@ static int omap_iommu_runtime_suspend(struct device *dev)
>   * reset line. The function also restores any locked TLBs if
>   * resuming after a suspend.
>   **/
> -static int omap_iommu_runtime_resume(struct device *dev)
> +static __maybe_unused int omap_iommu_runtime_resume(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct iommu_platform_data *pdata = dev_get_platdata(dev);
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
