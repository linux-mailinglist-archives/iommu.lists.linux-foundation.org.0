Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0A3AB958
	for <lists.iommu@lfdr.de>; Fri,  6 Sep 2019 15:35:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3D2FF2329;
	Fri,  6 Sep 2019 13:35:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5BA0F2323
	for <iommu@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:35:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 52B07756
	for <iommu@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:35:49 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id j16so6037458ljg.6
	for <iommu@lists.linux-foundation.org>;
	Fri, 06 Sep 2019 06:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xs44Y9C5kY9tV3QgTmhRhvweKEdDbOReR13zxyIFFm4=;
	b=P+wdYOXpehdroAADXmlcuh1eKFwYQnN9366FZu4R1fvFkm0lVI+c7zFRMrez/myy5J
	pK+j9uFHU1sR2CyMU8GF6RDjY6C5oRSviR+jOYAkCVKEwx3oBEoAiBW/nuJJnz4QhL9U
	jMaHsJfoXNhassZc0ZQ3K/s4tt4XTdh1E3/oNqSxEUJAa50xZDVRscWWRdkaryc2FdvH
	9nJEZ0TSssBVBeIwazelGPD3TXqdYEFK7pzqeOXqWYx0pDIKalCZr9tlGEbw1q0WpqeT
	YOjoXWtjJ6vELErSJukfsrO5hMk/TH1mq/2XNc1bNVOvbLXJUOIAQ78A23RPEMDppzTS
	CiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xs44Y9C5kY9tV3QgTmhRhvweKEdDbOReR13zxyIFFm4=;
	b=ZLd3WkVLzotmPTHXuljOx3K//REEE4XZ6Og05oeTlG1HQqBCF+7SFE1BJ3aeCTFaCA
	vzVDiDtErNhWq0ltlkCPSZdbcQ1kAB+BnjG/rE0UQpXdUqSr5CIZ67Q6VV2FxB33FJzS
	lVJdnRAMKaXuCAEU4soZsW2RHktL1thU/KMR+76vbdkTXFeanXPtr5iwYstmVvTBr+IM
	OnFjrs3BWnIN1HwGuqIsoWaddR5k8XhiZ4ScoxHM6wmSdEHeAH7iCk4XJ7dQrj3U/BvE
	BH5Cdygb+pWasvQAPi6ctFbgLvdXkPVwYiD45y3iEV+iKdR3h+SjsSACSSjJ4ivgahxX
	3Ugg==
X-Gm-Message-State: APjAAAUxOMrxI+mucZ7Ki9517ujogl5DrVrgaO7mMFRO18NWti3KafEd
	BTU665f7TzIWDAebObzEvy4RPJ3GRxoFE+j0KXA=
X-Google-Smtp-Source: APXvYqzxJ7WXxHJ/RpsvAOAd7PcptKpBh+T3mH0KMZgK4eRb/w+5tXb58u023SExLR7cXWypmkkwfEQ8EMhzxlF2a9o=
X-Received: by 2002:a2e:83d6:: with SMTP id s22mr5760872ljh.104.1567776947696; 
	Fri, 06 Sep 2019 06:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <1567413598-4477-1-git-send-email-jrdr.linux@gmail.com>
	<CAFqt6zYkFk55gzmfwMFzpWiOp0xP3DXdmWyO2Ce8+mqYW12SNw@mail.gmail.com>
	<61bd1ea6-10b7-a1ee-fd79-327abf09fd73@oracle.com>
In-Reply-To: <61bd1ea6-10b7-a1ee-fd79-327abf09fd73@oracle.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Fri, 6 Sep 2019 19:05:36 +0530
Message-ID: <CAFqt6zZeenG495uAL09zXxTW+OeUrRzY+8eWd8CSzsu=xOZ2_A@mail.gmail.com>
Subject: Re: [PATCH v2] swiotlb-xen: Convert to use macro
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org,
	konrad.wilk@oracle.com, Sabyasachi Gupta <sabyasachi.linux@gmail.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org
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

On Fri, Sep 6, 2019 at 7:02 PM Boris Ostrovsky
<boris.ostrovsky@oracle.com> wrote:
>
> On 9/6/19 8:27 AM, Souptick Joarder wrote:
> > On Mon, Sep 2, 2019 at 2:04 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
> >> Rather than using static int max_dma_bits, this
> >> can be coverted to use as macro.
> >>
> >> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> >> Reviewed-by: Juergen Gross <jgross@suse.com>
> > If it is still not late, can we get this patch in queue for 5.4 ?
>
>
> Yes, I will queue it later today.

Thanks Boris.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
