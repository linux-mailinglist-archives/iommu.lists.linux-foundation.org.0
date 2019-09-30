Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 035BDC2607
	for <lists.iommu@lfdr.de>; Mon, 30 Sep 2019 20:36:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0686F1AE4;
	Mon, 30 Sep 2019 18:36:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 563C41ADE
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 18:36:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 01F7A8AE
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 18:36:44 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B8014224ED
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 18:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569868603;
	bh=1tL/OZOkCQgzZnBFplZTU+ckRrS4/sDh6E9zhlDzq/c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=y9r7bli47fVGj+4fjTYQ6PAXVa0UI+u3pZnzIoPcyL5ummMRbOrFM8Z8ezx0c9O9M
	OWWNIjwXkelXIdFKvH0eTzLFL3aK4P1ZUn6RPdwLnHsRpcYvtGERwjcypBmW+az2Ot
	OoolrSVYpG+lt/hn0Iww7kUj5dPAJgA21mXP8u00=
Received: by mail-qt1-f180.google.com with SMTP id c21so18267980qtj.12
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 11:36:43 -0700 (PDT)
X-Gm-Message-State: APjAAAWqiXIfB66r4Keuc0t1VrXsU+P2L53SiY3MyrBbzF6Lbk1LJmLa
	GSIBjdFyNXeuvWsHu3dq/X8SXowNtY3+EO+SaA==
X-Google-Smtp-Source: APXvYqzrW8P34cQHwAL7kkHCPf/H7Il3VJU7gB5YH+0CDpc3kU87kepa13cpt99giygGkK5bkJVuq6phphJeVpRAcNg=
X-Received: by 2002:a05:6214:11b4:: with SMTP id
	u20mr19329160qvv.200.1569868602914; 
	Mon, 30 Sep 2019 11:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569851517.git.robin.murphy@arm.com>
	<fd1f7700165b2e2679fe6d499ec38b91f4a432f4.1569851517.git.robin.murphy@arm.com>
In-Reply-To: <fd1f7700165b2e2679fe6d499ec38b91f4a432f4.1569851517.git.robin.murphy@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Sep 2019 13:36:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJD0DKZkDAOsAcJPM24opvRqKHB3jsHqjeyjQM2WV9BEw@mail.gmail.com>
Message-ID: <CAL_JsqJD0DKZkDAOsAcJPM24opvRqKHB3jsHqjeyjQM2WV9BEw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] iommu/io-pgtable-arm: Allow coherent walks for Mali
To: Robin Murphy <robin.murphy@arm.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Steven Price <steven.price@arm.com>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	Will Deacon <will@kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
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

On Mon, Sep 30, 2019 at 9:11 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Midgard GPUs have ACE-Lite master interfaces which allows systems to
> integrate them in an I/O-coherent manner. It seems that from the GPU's
> viewpoint, the rest of the system is its outer shareable domain, and so
> even when snoop signals are wired up, they are only emitted for outer
> shareable accesses. As such, setting the TTBR_SHARE_OUTER bit does
> indeed get coherent pagetable walks working nicely for the coherent
> T620 in the Arm Juno SoC.
>
> Exploiting coherency for data accesses is more of a challenge, since
> not only do we need to get the GPU MMU attributes right but we'd also
> have to avoid pgprot_writecombine creating an attribute mismatch on
> the CPU side, so we won't try wiring that up just yet.
>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
