Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA8BB3E3
	for <lists.iommu@lfdr.de>; Sat, 27 Apr 2019 18:20:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C454B1A5D;
	Sat, 27 Apr 2019 16:20:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4821618B9
	for <iommu@lists.linux-foundation.org>;
	Sat, 27 Apr 2019 16:18:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E63A7786
	for <iommu@lists.linux-foundation.org>;
	Sat, 27 Apr 2019 16:18:55 +0000 (UTC)
Received: from localhost (unknown [12.154.31.190])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 6471F14C711BA;
	Sat, 27 Apr 2019 09:18:54 -0700 (PDT)
Date: Sat, 27 Apr 2019 12:18:50 -0400 (EDT)
Message-Id: <20190427.121850.1265777273042838957.davem@davemloft.net>
To: laurentiu.tudor@nxp.com
Subject: Re: [PATCH v2 3/9] fsl/fman: backup and restore ICID registers
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190427071031.6563-4-laurentiu.tudor@nxp.com>
References: <20190427071031.6563-1-laurentiu.tudor@nxp.com>
	<20190427071031.6563-4-laurentiu.tudor@nxp.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Sat, 27 Apr 2019 09:18:55 -0700 (PDT)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: madalin.bucur@nxp.com, netdev@vger.kernel.org, roy.pledge@nxp.com,
	linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
	iommu@lists.linux-foundation.org, camelia.groza@nxp.com,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: laurentiu.tudor@nxp.com
Date: Sat, 27 Apr 2019 10:10:25 +0300

> @@ -1914,7 +1936,10 @@ static int fman_reset(struct fman *fman)
>  static int fman_init(struct fman *fman)
>  {
>  	struct fman_cfg *cfg = NULL;
> -	int err = 0, i, count;
> +	int err = 0, count;
> +#ifdef CONFIG_PPC
> +	int i;
> +#endif
>  
>  	if (is_init_done(fman->cfg))
>  		return -EINVAL;
> @@ -1934,6 +1959,7 @@ static int fman_init(struct fman *fman)
>  	memset_io((void __iomem *)(fman->base_addr + CGP_OFFSET), 0,
>  		  fman->state->fm_port_num_of_cg);
>  
> +#ifdef CONFIG_PPC
>  	/* Save LIODN info before FMan reset
>  	 * Skipping non-existent port 0 (i = 1)
>  	 */

Sorry, I'm not OK with littering a networking driver with arch ifdefs
all over the place.

Please create a proper abstraction and set of interfaces.

Thank you.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
