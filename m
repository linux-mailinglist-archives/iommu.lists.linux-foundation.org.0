Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EEA432B77
	for <lists.iommu@lfdr.de>; Tue, 19 Oct 2021 03:22:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A25E283BED;
	Tue, 19 Oct 2021 01:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1IBmvBcjf-V5; Tue, 19 Oct 2021 01:22:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A522883BEA;
	Tue, 19 Oct 2021 01:22:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E6A7C001E;
	Tue, 19 Oct 2021 01:22:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDC64C000D
 for <iommu@lists.linux-foundation.org>; Tue, 19 Oct 2021 01:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD44683BE9
 for <iommu@lists.linux-foundation.org>; Tue, 19 Oct 2021 01:22:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3s44K1Sv5Iv for <iommu@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 01:22:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD53E83BE5
 for <iommu@lists.linux-foundation.org>; Tue, 19 Oct 2021 01:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634606548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PAWMrVJYLpXAoOvCUd/tM5Gm44xehWjfXcNdmzTezCc=;
 b=eOE42G7nv4RZyuieKssCzYHUXckoLp29MkpHYXSO6p1vjWF4XjJV8YhGl4rCsHwR5BhBdo
 I0SsRjhftBcNhpb9rjpOu1HpK4rRgcdV6HxLVeWeHESmKSapG3zbswd4P47E8NyazEk9Kg
 zzz2kULpH7DZgSjlN8x+4zl9Aqz6bsI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-szNKq9-2NT2PagcqvxYKHw-1; Mon, 18 Oct 2021 21:22:27 -0400
X-MC-Unique: szNKq9-2NT2PagcqvxYKHw-1
Received: by mail-lf1-f70.google.com with SMTP id
 i1-20020a056512340100b003fdd5b951e0so732626lfr.22
 for <iommu@lists.linux-foundation.org>; Mon, 18 Oct 2021 18:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PAWMrVJYLpXAoOvCUd/tM5Gm44xehWjfXcNdmzTezCc=;
 b=A8TS1ajROT1/3rmiQEIyNWHGggqbIoyWBq/YqrISvnbvWe8S0ps66gyYAJFne57vDO
 9lPIGBEjMgR3shq7AP+qseqdIzHHTSMC8FZfx9G5AlSo3M2/n7yDpLFOMIsYo7SLiUMt
 OP2HoDBqk5w5DFV3VZCxxDVHfkncwrynqCiHKrhv/4q/ipDATVNH85nVD/lyblGyaD8M
 N737SM+pJOcoIVk08d7UCJE+JRpvwZz0LPNbIpSl2RtqIu3jVCpGywt6cKrRUBlfg4xq
 eoB+lKWywLzARaiwEKSqMCwmIqYeSzZlyIxXGRw5Zc0qwur1JFdETdt6XA9AiAI2KaCn
 xgCQ==
X-Gm-Message-State: AOAM532vqWCXey3F737tODPzF9ko9O2xbpiLTI8TM5dS7sO3PsT8PKYa
 D7veusMYdTHN39/WVWIWO4Ymc+GFMGEPLa0uec7SOIdqUAWHqOUXnelAvakZP6jyO0q6s4yCykV
 K8xB2QMRG5O1UpnM4+bh44XaYp8eTDIA8RlwwizYV0CqUow==
X-Received: by 2002:a2e:5344:: with SMTP id t4mr3438888ljd.362.1634606545558; 
 Mon, 18 Oct 2021 18:22:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx2VZpO94ATTLdLFfRE+4QfWp6/JFORuL5M9U6kAQ0JTPA55qnbYtwgWI3nfmFfTLzmXBBmOcvD4FuX2UkHI0=
X-Received: by 2002:a2e:5344:: with SMTP id t4mr3438859ljd.362.1634606545252; 
 Mon, 18 Oct 2021 18:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211013121052.518113-1-jean-philippe@linaro.org>
 <BN9PR11MB5433EFF47E5FABC1D7D95F6F8CB89@BN9PR11MB5433.namprd11.prod.outlook.com>
 <YW2RfXJwAxFYOYzs@myrica> <20211018113237-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211018113237-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 19 Oct 2021 09:22:13 +0800
Message-ID: <CACGkMEuJrQcPSMdRJ9wmc3riLK_3Q6t9596b5ida-j00Yf7+WQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] iommu/virtio: Add identity domains
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Boeuf,
 Sebastien" <sebastien.boeuf@intel.com>, "will@kernel.org" <will@kernel.org>
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

On Mon, Oct 18, 2021 at 11:35 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Oct 18, 2021 at 04:23:41PM +0100, Jean-Philippe Brucker wrote:
> > On Thu, Oct 14, 2021 at 03:00:38AM +0000, Tian, Kevin wrote:
> > > > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > > Sent: Wednesday, October 13, 2021 8:11 PM
> > > >
> > > > Support identity domains, allowing to only enable IOMMU protection for a
> > > > subset of endpoints (those assigned to userspace, for example). Users
> > > > may enable identity domains at compile time
> > > > (CONFIG_IOMMU_DEFAULT_PASSTHROUGH), boot time
> > > > (iommu.passthrough=1) or
> > > > runtime (/sys/kernel/iommu_groups/*/type = identity).
> > >
> > > Do we want to use consistent terms between spec (bypass domain)
> > > and code (identity domain)?
> >
> > I don't think we have to. Linux uses "identity" domains and "passthrough"
> > IOMMU. The old virtio-iommu feature was "bypass" so we should keep that
> > for the new one, to be consistent. And then I've used "bypass" for domains
> > as well, in the spec, because it would look strange to use a different
> > term for the same concept. I find that it sort of falls into place: Linux'
> > identity domains can be implemented either with bypass or identity-mapped
> > virtio-iommu domains.
> >
> > > >
> > > > Patches 1-2 support identity domains using the optional
> > > > VIRTIO_IOMMU_F_BYPASS_CONFIG feature. The feature bit is not yet in the
> > > > spec, see [1] for the latest proposal.
> > > >
> > > > Patches 3-5 add a fallback to identity mappings, when the feature is not
> > > > supported.
> > > >
> > > > Note that this series doesn't touch the global bypass bit added by
> > > > VIRTIO_IOMMU_F_BYPASS_CONFIG. All endpoints managed by the IOMMU
> > > > should
> > > > be attached to a domain, so global bypass isn't in use after endpoints
> > >
> > > I saw a concept of deferred attach in iommu core. See iommu_is_
> > > attach_deferred(). Currently this is vendor specific and I haven't
> > > looked into the exact reason why some vendor sets it now. Just
> > > be curious whether the same reason might be applied to virtio-iommu.
> > >
> > > > are probed. Before that, the global bypass policy is decided by the
> > > > hypervisor and firmware. So I don't think Linux needs to touch the
> > >
> > > This reminds me one thing. The spec says that the global bypass
> > > bit is sticky and not affected by reset.
> >
> > The spec talks about *device* reset, triggered by software writing 0 to
> > the status register, but it doesn't mention system reset. Would be good to
> > clarify that. Something like:
> >
> >     If the device offers the VIRTIO_IOMMU_F_BYPASS_CONFIG feature, it MAY
> >     initialize the \field{bypass} field to 1. Field \field{bypass} SHOULD
> >     NOT change on device reset, but SHOULD be restored to its initial
> >     value on system reset.
> >
> > > This implies that in the case
> > > of rebooting the VM into a different OS, the previous OS actually
> > > has the right to override this setting for the next OS. Is it a right
> > > design? Even the firmware itself is unable to identify the original
> > > setting enforced by the hypervisor after reboot. I feel the hypervisor
> > > setting should be recovered after reset since it reflects the
> > > security measure enforced by the virtual platform?
> >
> > So I think clarifying system reset should address your questions.
> > I believe we should leave bypass sticky across device reset, so a FW->OS
> > transition, where the OS resets the device, does not open a vulnerability
> > (if bypass was enabled at boot and then left disabled by FW.)
> >
> > It's still a good idea for the OS to restore on shutdown the bypass value
> > it was booted with. So it can kexec into an OS that doesn't support
> > virtio-iommu, for example.
> >
> > Thanks,
> > Jean
>
> Is this stickiness really important? Can't this be addressed just by
> hypervisor disabling bypass at boot?

And I'm not sure if sticky can survive transport reset.

Thanks

>
> --
> MST
>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
