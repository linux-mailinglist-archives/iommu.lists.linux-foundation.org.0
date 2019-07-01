Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EA91244CB4
	for <lists.iommu@lfdr.de>; Thu, 13 Jun 2019 21:58:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 98E5E15BD;
	Thu, 13 Jun 2019 19:58:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9F13B15BD
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 19:58:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from pokefinder.org (sauhun.de [88.99.104.3])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 44B4D711
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 19:58:41 +0000 (UTC)
Received: from localhost (p5486CF99.dip0.t-ipconnect.de [84.134.207.153])
	by pokefinder.org (Postfix) with ESMTPSA id 669B74A127B;
	Thu, 13 Jun 2019 21:58:40 +0200 (CEST)
Date: Thu, 13 Jun 2019 21:58:40 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH v6 5/5] mmc: queue: Use bigger segments if IOMMU can
	merge the segments
Message-ID: <20190613195839.GE6863@kunai>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1560421215-10750-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
In-Reply-To: <1560421215-10750-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: axboe@kernel.dk, linux-renesas-soc@vger.kernel.org, ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
	wsa+renesas@sang-engineering.com,
	iommu@lists.linux-foundation.org, hch@lst.de
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
Content-Type: multipart/mixed; boundary="===============5428652627234108751=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============5428652627234108751==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AsxXAMtlQ5JHofzM"
Content-Disposition: inline


--AsxXAMtlQ5JHofzM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -	blk_queue_max_segments(mq->queue, host->max_segs);
> +	/* blk_queue_can_use_iommu_merging() should succeed if can_merge = 1 */
> +	if (host->can_merge &&
> +	    !blk_queue_can_use_iommu_merging(mq->queue, mmc_dev(host)))
> +		WARN_ON(1);
> +	blk_queue_max_segments(mq->queue, mmc_get_max_segments(host));

Maybe we could use WARN here to save the comment and move the info to
the printout?

-	blk_queue_max_segments(mq->queue, host->max_segs);
+	if (host->can_merge)
+		WARN(!blk_queue_can_use_iommu_merging(mq->queue, mmc_dev(host)),
+		     "merging was advertised but not possible\n");
+	blk_queue_max_segments(mq->queue, mmc_get_max_segments(host));


--AsxXAMtlQ5JHofzM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0Cqu8ACgkQFA3kzBSg
KbadfhAAq7Or22NlUZ69xSQh5IjO2ZwQHROwTG9rZwvQ6FkHsCRSuNihBVPuo4u/
uRaX75NEkDQYl8RjRKFluOKjLQH/TSjqSkQu3f82ZozJrgWJJ06FcWLzr7HSWfzO
Lox+7B6vk23pAjwnC5JDMNf2gBxAu5ZsZA2frkHTUYfZMS26zWxw5PKaB9INsuM7
IMzNO5J84ZMNpZitbBDb6p0MecEadseBi2SXnxFL+wTIksuLFHfZbaBRsf0sXF1/
Sy/GlZ1kQ6t8C+zjx525Y2c1rLaZSvRSQhXh0e+gaJ83U9rd+dgvyhd6xvz5Vn5k
Iqh2RS2U8iTQRUTUFXJwk/AOCYK3SkK6UdqWZESlQFLS6odUcLxub4Ux3hwve1xi
ql2C7s/EiVz7KB0HD6blLUoTvIgFnPcvL2UdxoHLGrhfU+k0tSGSh2NpIDTAuO+f
tBE8KQ3V4Mgjxm1ygYnnsdUYC7jMdxgcrz6xZHU2EwvOmyKvI8mwMDpJoIiK/xAn
BwZ7vU+IFG0QJ5X19QbRNGz4It86dWpaeQbWBvEX8kL+bg/2N2TJGtwHBaWCJgHQ
YBZjIeGm/0cM0psHWxuMyYjA2F4X2K7TQGBcBG8+CBD6hLvyV1Jgdrj8lzk1JKnk
V1tWov7zFB7ikEeybIsHBXXw6/jBx/cFz09yslcLeno79gh1Lx8=
=GBvH
-----END PGP SIGNATURE-----

--AsxXAMtlQ5JHofzM--

--===============5428652627234108751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5428652627234108751==--
