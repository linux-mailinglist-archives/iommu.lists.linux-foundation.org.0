Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FFCB09A6
	for <lists.iommu@lfdr.de>; Thu, 12 Sep 2019 09:44:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D4F5DC9F;
	Thu, 12 Sep 2019 07:44:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AE202ACD
	for <iommu@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 07:44:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 16C2E81A
	for <iommu@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 07:44:08 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1i8Jlr-0001qk-0T; Thu, 12 Sep 2019 09:44:03 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <ukl@pengutronix.de>)
	id 1i8Jlh-00023h-Ee; Thu, 12 Sep 2019 09:43:53 +0200
Date: Thu, 12 Sep 2019 09:43:53 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v1 1/2] iommu: pass cell_count = -1 to
	of_for_each_phandle with cells_name
Message-ID: <20190912074353.wqohpfydjxueqade@pengutronix.de>
References: <20190824132846.8589-1-u.kleine-koenig@pengutronix.de>
	<20190903125210.GB11530@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903125210.GB11530@8bytes.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: iommu@lists.linux-foundation.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Tue, Sep 03, 2019 at 02:52:10PM +0200, Joerg Roedel wrote:
> On Sat, Aug 24, 2019 at 03:28:45PM +0200, Uwe Kleine-K=F6nig wrote:
> > Currently of_for_each_phandle ignores the cell_count parameter when a
> > cells_name is given. I intend to change that and let the iterator fall
> > back to a non-negative cell_count if the cells_name property is missing
> > in the referenced node.
> > =

> > To not change how existing of_for_each_phandle's users iterate, fix them
> > to pass cell_count =3D -1 when also cells_name is given which yields the
> > expected behaviour with and without my change.
> > =

> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/iommu/arm-smmu.c     | 2 +-
> >  drivers/iommu/mtk_iommu_v1.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> =

> Acked-by: Joerg Roedel <jroedel@suse.de>

Does this ack mean that Rob is expected to apply this together with
patch 2?

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
