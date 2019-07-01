Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BEC458E6
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 11:39:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EF30510BA;
	Fri, 14 Jun 2019 09:39:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 477FF10B2
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 09:39:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5B8F9711
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 09:39:00 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s3so1623384wms.2
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 02:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LqQdZbnfdndSGEKuXAyzbSvP0EJ1Sec6YVrk3FnRlEM=;
	b=qgw0pIuu1rFL+i70K3kUIemzqa4SZ07PlSHmjoCjs/NUiOM0oqexSZP3DGhjH4PxXu
	Bra017CVuMGsI5z61jNq5TbmvDQBLdpIXmcaYJrNiBMsUrz7845Pr7v1cNcnshpeQucJ
	alKkxcSF3CByhVvejNkHeiPH8Jf8vDI/yA3KtGpt1Qj+EUOwoWDrVfcQUDaCTO6qu/JR
	UguDP3DM73nEQBUokHbnvHHPQMZguSynixywMfPqrS/OWn0pH6ujRPJLB0kIljBrbSJk
	r9/ur6TEq1lGa4vZTU+XJY6mEJQInfzLGrDaNxS58Jd0UyVjqmsn+YpiYc3ZzYi0BvX/
	rEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LqQdZbnfdndSGEKuXAyzbSvP0EJ1Sec6YVrk3FnRlEM=;
	b=TFp4Pqs7gP8HPEbDBPl1lCLD/m4SqHNzgNl4tGCwCd50cTl2kasY84AdldX5QL/GQL
	2UUngWqoukEEORHqYt4FMYyyjS73J6HMAMrXCjdvU0KQtgMAj9ZHW1Apjwmp275sjFDY
	vNk/Q4i060d1aDimpB5Avw+4RNOON7f7US9OIy9kOm72BvDVeRiJ9H4X6PttnQq8sdlU
	uq3C2W/GhJpwnWj36IBvsaOa0RWWqJBdqLYd8ImQfvGbygdxsjypexAnq6JFg+z4vD5a
	jYD4eveXM48jQv7RCNSHNCZpf7NGktf5Xnce4kmIeq4OE4vJrfudvcouJFKxHH3wVwzk
	zaHA==
X-Gm-Message-State: APjAAAX00IY5y/h/HoEyuSrEQnQzxu/4QpXdgjtAoms+YwLpd7v2LiHE
	wKby9u9qPWhKrXkrWjAOu6g=
X-Google-Smtp-Source: APXvYqwQUmFDbeYguJ3kCrrDZsY3WGAWRfX6ZldaahiBceRX5O8X86YZX1rWzTL5s2P9DyYnAzT5+A==
X-Received: by 2002:a1c:b684:: with SMTP id g126mr7061480wmf.176.1560505138843;
	Fri, 14 Jun 2019 02:38:58 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
	by smtp.gmail.com with ESMTPSA id v4sm1040149wmg.22.2019.06.14.02.38.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 14 Jun 2019 02:38:57 -0700 (PDT)
Date: Fri, 14 Jun 2019 11:38:56 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] driver: core: Allow subsystems to continue deferring
	probe
Message-ID: <20190614093856.GC15526@ulmo>
References: <20190613170011.9647-1-thierry.reding@gmail.com>
	<20190614091058.GA25912@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20190614091058.GA25912@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Kevin Hilman <khilman@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-pm@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
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
Content-Type: multipart/mixed; boundary="===============6612287130877062592=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============6612287130877062592==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Content-Disposition: inline


--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 11:10:58AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jun 13, 2019 at 07:00:11PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Some subsystems, such as pinctrl, allow continuing to defer probe
> > indefinitely. This is useful for devices that depend on resources
> > provided by devices that are only probed after the init stage.
> >=20
> > One example of this can be seen on Tegra, where the DPAUX hardware
> > contains pinmuxing controls for pins that it shares with an I2C
> > controller. The I2C controller is typically used for communication
> > with a monitor over HDMI (DDC). However, other instances of the I2C
> > controller are used to access system critical components, such as a
> > PMIC. The I2C controller driver will therefore usually be a builtin
> > driver, whereas the DPAUX driver is part of the display driver that
> > is loaded from a module to avoid bloating the kernel image with all
> > of the DRM/KMS subsystem.
> >=20
> > In this particular case the pins used by this I2C/DDC controller
> > become accessible very late in the boot process. However, since the
> > controller is only used in conjunction with display, that's not an
> > issue.
> >=20
> > Unfortunately the driver core currently outputs a warning message
> > when a device fails to get the pinctrl before the end of the init
> > stage. That can be confusing for the user because it may sound like
> > an unwanted error occurred, whereas it's really an expected and
> > harmless situation.
> >=20
> > In order to eliminate this warning, this patch allows callers of the
> > driver_deferred_probe_check_state() helper to specify that they want
> > to continue deferring probe, regardless of whether we're past the
> > init stage or not. All of the callers of that function are updated
> > for the new signature, but only the pinctrl subsystem passes a true
> > value in the new persist parameter if appropriate.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v2:
> > - pass persist flag via flags parameter to make the function call easier
> >   to understand
> >=20
> >  drivers/base/dd.c            | 19 ++++++++++++++-----
> >  drivers/base/power/domain.c  |  2 +-
> >  drivers/iommu/of_iommu.c     |  2 +-
> >  drivers/pinctrl/devicetree.c |  9 +++++----
> >  include/linux/device.h       | 18 +++++++++++++++++-
> >  5 files changed, 38 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > index 0df9b4461766..0399a6f6c479 100644
> > --- a/drivers/base/dd.c
> > +++ b/drivers/base/dd.c
> > @@ -238,23 +238,32 @@ __setup("deferred_probe_timeout=3D", deferred_pro=
be_timeout_setup);
> >  /**
> >   * driver_deferred_probe_check_state() - Check deferred probe state
> >   * @dev: device to check
> > + * @flags: Flags used to control the behavior of this function. Driver=
s can
> > + *   set the DRIVER_DEFER_PROBE_PERSIST flag to indicate that they wan=
t to
> > + *   keep trying to probe after built-in drivers have had a chance to =
probe.
> > + *   This is useful for built-in drivers that rely on resources provid=
ed by
> > + *   modular drivers.
> >   *
> >   * Returns -ENODEV if init is done and all built-in drivers have had a=
 chance
> > - * to probe (i.e. initcalls are done), -ETIMEDOUT if deferred probe de=
bug
> > - * timeout has expired, or -EPROBE_DEFER if none of those conditions a=
re met.
> > + * to probe (i.e. initcalls are done) and unless the DRIVER_DEFER_PROB=
E_PERSIST
> > + * flag is set, -ETIMEDOUT if deferred probe debug timeout has expired=
, or
> > + * -EPROBE_DEFER if none of those conditions are met.
> >   *
> >   * Drivers or subsystems can opt-in to calling this function instead o=
f directly
> >   * returning -EPROBE_DEFER.
> >   */
> > -int driver_deferred_probe_check_state(struct device *dev)
> > +int driver_deferred_probe_check_state(struct device *dev, unsigned lon=
g flags)
> >  {
> >  	if (initcalls_done) {
> >  		if (!deferred_probe_timeout) {
> >  			dev_WARN(dev, "deferred probe timeout, ignoring dependency");
> >  			return -ETIMEDOUT;
> >  		}
> > -		dev_warn(dev, "ignoring dependency for device, assuming no driver");
> > -		return -ENODEV;
> > +
> > +		if ((flags & DRIVER_DEFER_PROBE_PERSIST) =3D=3D 0) {
> > +			dev_warn(dev, "ignoring dependency for device, assuming no driver");
> > +			return -ENODEV;
> > +		}
> >  	}
> >  	return -EPROBE_DEFER;
> >  }
> > diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> > index 33c30c1e6a30..6198c6a30fe2 100644
> > --- a/drivers/base/power/domain.c
> > +++ b/drivers/base/power/domain.c
> > @@ -2423,7 +2423,7 @@ static int __genpd_dev_pm_attach(struct device *d=
ev, struct device *base_dev,
> >  		mutex_unlock(&gpd_list_lock);
> >  		dev_dbg(dev, "%s() failed to find PM domain: %ld\n",
> >  			__func__, PTR_ERR(pd));
> > -		return driver_deferred_probe_check_state(base_dev);
> > +		return driver_deferred_probe_check_state(base_dev, 0);
>=20
> Again, I said no odd flags for functions, how is anyone supposed to know
> what "0" means here?

Technically you said "no boolean flags". And I think it's pretty common
to have this type of flag bitmask to change the behavior of functions. 0
is typically considered as the "run normally" case where you don't
really have to care.

> You just swapped a boolean for a bitmapped flag, right?  That did not
> make the api any easier to understand at all.

Granted, the normal case isn't made any easier with "0" than with
"false", but certainly the cases where we do pass one or more flags are
now much easier to understand.

> > +/*
> > + * This can be use to continue to defer probe after the init stage and=
 after
> > + * all the built-in drivers have had a chance to probe. This is useful=
 if a
> > + * built-in driver requires resources provided by a modular driver.
> > + *
> > + * One such example is the pinctrl subsystem, where for example the DP=
AUX
> > + * hardware on Tegra provides pinmuxing controls for pins shared betwe=
en DPAUX
> > + * and I2C controllers. Only a subset of I2C controllers need the DPAUX
> > + * pinmuxing, and some I2C controllers are used during early boot for =
critical
> > + * tasks (such as communicating with the system PMIC). The I2C control=
lers
> > + * that don't share pins with a DPAUX block will want to be driven by =
a built-
> > + * in driver to make sure they are available early on.
> > + */
> > +#define DRIVER_DEFER_PROBE_PERSIST (1 << 0)
>=20
> In the future, please always use BIT() for stuff like this.
>=20
> Anyway, this isn't ok, do it correctly please, like I asked for the
> first time...

To avoid further back and forth, what exactly is it that you would have
me do? That is, what do you consider to be the correct way to do this?

Would you prefer me to add another function with a different name that
reimplements the functionality only with the exception? Something along
the lines of:

	int driver_deferred_probe_check_state_continue(struct device *dev)
	{
		int ret;

		ret =3D driver_deferred_probe_check_state(dev);
		if (ret =3D=3D -ENODEV)
			return -EPROBE_DEFER;

		return ret;
	}

? I'd need to split that up some more to avoid the warning that the
inner function prints before returning -ENODEV, but that's a minor
detail. Would that API be more to your liking?

Thierry

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Day0ACgkQ3SOs138+
s6GxTg//b1dUH2eXBV3IJflbGCV5IMsAevzJqHxEBda0tczchU21K76IdajV8eYp
T0wxXS5DfBzU+z305Pn4xZPm9m4TPyv62axrC1U91kitqsBzBLLK73uDSsW01zSu
lSm6y3k2lwPvrS6EKgA1HQPqXZfUOWxEJk7S4bCN28ZfTY+Pg1NxDH2qTc8fDH8F
tl6KRHLyboRllm0gN7nIyseVBhUr2AkpjyuQjiNNH7EN1sbTBaM0YjL7cqatVznm
nc19CLf5OHib08cJwytOQV0s7Zvp9fn9KZTqEaFZMBXmWKpJOWECisOjWqFNTYud
k6FwhphtspbzOjMdK2rnWt3YU3BHrTabmh5B6iTtAAK5ZO5xrcey5QIZOO/l/qqM
/YVBvqsqmaaEwLfRNblz5IN55VALlGjfSEIbJ2yH1lReBLOc9bCLtpidU7eoBsPg
7PGGY2y6hKzBJ+JZ8tNan1Qy26zhKKhVMQ4cT88XUrXwYhl6k34fAP4rio3IfbQK
bZrq+LQasch/6a3Fro8GcGpq9TtoCX1mgxW5OXIQG9M55v3MONRL892Yp5uHq4ft
txxqSrU8XfPXrBLw1IhtRAWSdsRi7cNT1l1ShjpXuuVWV1Th2yW5CVeC6H/EJMKY
t5o6Cn8zAs4MGpa5+6DZWms8BJts4Rcg6MeY8AUmiIN2evZ9qV8=
=ZyBI
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--

--===============6612287130877062592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============6612287130877062592==--
