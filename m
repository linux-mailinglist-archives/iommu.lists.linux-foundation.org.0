Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E371A6188
	for <lists.iommu@lfdr.de>; Tue,  3 Sep 2019 08:33:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3FAC7C96;
	Tue,  3 Sep 2019 06:33:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7C5E0C8E
	for <iommu@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 06:33:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ED05C709
	for <iommu@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 06:33:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id C62D5227A8A; Tue,  3 Sep 2019 08:33:50 +0200 (CEST)
Date: Tue, 3 Sep 2019 08:33:50 +0200
From: "hch@lst.de" <hch@lst.de>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v10 3/4] block: add a helper function to merge the segments
Message-ID: <20190903063350.GA16908@lst.de>
References: <1566995743-5614-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1566995743-5614-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<e549e8e7-9dfe-6f68-2148-f49a9089db37@kernel.dk>
	<TYAPR01MB454492ADBC8561C0BEC6F449D8B90@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TYAPR01MB454492ADBC8561C0BEC6F449D8B90@TYAPR01MB4544.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jens Axboe <axboe@kernel.dk>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>
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

On Tue, Sep 03, 2019 at 04:59:59AM +0000, Yoshihiro Shimoda wrote:
> Hi Christoph,
> 
> Now this patch series got {Ack,Review}ed-by from each maintainer.
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=166501
> 
> So, would you pick this up through the dma-mapping tree as you said before?

I've applied it to the dma-mapping tree for 5.4 now, thanks a lot!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
