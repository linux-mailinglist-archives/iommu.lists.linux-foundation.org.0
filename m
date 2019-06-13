Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F82444C5E
	for <lists.iommu@lfdr.de>; Thu, 13 Jun 2019 21:40:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1FACF1596;
	Thu, 13 Jun 2019 19:40:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AB2651590
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 19:40:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from pokefinder.org (sauhun.de [88.99.104.3])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 7533A711
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 19:40:40 +0000 (UTC)
Received: from localhost (p5486CF99.dip0.t-ipconnect.de [84.134.207.153])
	by pokefinder.org (Postfix) with ESMTPSA id A63294A127B;
	Thu, 13 Jun 2019 21:40:39 +0200 (CEST)
Date: Thu, 13 Jun 2019 21:40:38 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH v6 2/5] block: sort headers on blk-setting.c
Message-ID: <20190613194038.GC6863@kunai>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1560421215-10750-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
In-Reply-To: <1560421215-10750-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
Content-Type: multipart/mixed; boundary="===============6436435472817212636=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============6436435472817212636==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Content-Disposition: inline


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 07:20:12PM +0900, Yoshihiro Shimoda wrote:
> This patch sorts the headers in alphabetic order to ease
> the maintenance for this part.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Yup, I got the same result :)

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0CprYACgkQFA3kzBSg
KbZVJA/8CYiC4KAb4ZKE4Mg2e92mY0FzKCoXyJ0PJgcli/gmfXTFbkO5qZ+oxE1P
zMMjpm99xunduO/0xXIL/+AkyKyFRBv62+LAknH47DHRslBPIINw8gIAEFTwiV3H
nOmXvs/QtXDzkMNbC0rctqCamxcksSuKTlLxVHM/RWQxWtOqn8VJzz0uedhUIvQU
8wlnZOYC6Rih/2i+OISP3Szg6852ZckLeL8nMfHpsivAydHlFoDTrkFlnPC7HvQy
QEHn1R5wyz4rQTShL3SpdGvzv5nsAOk5VoGptYYWPOS9uDuKTLQ71Ip9nmB3iPKJ
m7a6OrozGncNS1U9MIov5thNHmiuKM8lzWqL/wGthPSK7c0YgDMvFKBpd+smwSj/
gQiwB7py1iLWzI0a3L37tZCxnNuZafR0MONyXouCZcv9ruby9J8SUutherJIEt7t
w65zdUyLw/spqvVkbqG44EKKyhZyODmBBIziSDJgWQbJ1odnuImR2lqm92cizJn2
L/M5/5h3GqL1/C+cZuMKmky/ytn+UzAj5S5Ix+y2I2Wq4Cu4mrQS5hQ0L+7p7kw5
YBZUTgbth+oEeBulL+Rp+z/NAuKkRp3p+safGAxG+JRNkvw4M71Abq8Gq1otC1SW
SEuShkO4eoYn+CEUfm0r32hizvsY9Aw+TIlvVrsGjFFQIyPkNvw=
=yGu2
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--

--===============6436435472817212636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============6436435472817212636==--
