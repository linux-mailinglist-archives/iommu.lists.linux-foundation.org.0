Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E465573FF2
	for <lists.iommu@lfdr.de>; Wed, 24 Jul 2019 22:36:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9AEC614D6;
	Wed, 24 Jul 2019 20:36:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1CE0414CF
	for <iommu@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 20:36:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C36D8709
	for <iommu@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 20:36:54 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k8so92514788iot.1
	for <iommu@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 13:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ezauUXaQEEHVy+2OcDcxOeDrntwiw+XADj/ab5JOeyk=;
	b=euvFLQxpdbeQCXpi5gb02UmjrfAEA+yZp2ZLtWcqHjROf3p8B+Xvo3djgrucb4paAj
	z8YarMn4WkYv9t8hhsTgz0HKBTvr7IakH3thwXmWCvu1Sr8GdlChMU8ioLMUeZy5lnDU
	/hHhVo7zWZ+GYyjaB7ctT3tpQBVKx8nhgVEarWlQnBwVVkpDeqY2SCFEte/PB7KKDthl
	2MLSDg8PO0xuejisifDQwdnk2tqBiY1WcZPcr8CIPcsSZ5YIIWfB7xrlKeIRLiPH2SCm
	TMn8r0gvuVesuzv5N5SthgkaO+LeJ50+5FcfcwDyhX6VoRM3vQ12Ry1RVDSRhJtFAUCk
	e17g==
X-Gm-Message-State: APjAAAXdoBXwS1I5Zg4/VajO45UlCIKIeqfJdBrBOzX1IxmfQuc46FoA
	UriPBkQN8bdCaYmAI4upcg==
X-Google-Smtp-Source: APXvYqxi6iYl7bDx+4SE5POY1hGXofqijIvqy6IHLDGPzYHohBVh4g3K/4amhnyALZl9eJN0E91egA==
X-Received: by 2002:a05:6638:201:: with SMTP id
	e1mr7480694jaq.45.1564000614010; 
	Wed, 24 Jul 2019 13:36:54 -0700 (PDT)
Received: from localhost ([64.188.179.254]) by smtp.gmail.com with ESMTPSA id
	b8sm38661034ioj.16.2019.07.24.13.36.53
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Jul 2019 13:36:53 -0700 (PDT)
Date: Wed, 24 Jul 2019 14:36:52 -0600
From: Rob Herring <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: iommu/arm,smmu: add compatible
	string for Marvell
Message-ID: <20190724203652.GA27065@bogus>
References: <20190711150242.25290-1-gregory.clement@bootlin.com>
	<20190711150242.25290-4-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190711150242.25290-4-gregory.clement@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>, Antoine Tenart <antoine.tenart@bootlin.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Nadav Haklai <nadavh@marvell.com>, iommu@lists.linux-foundation.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	Hanna Hawa <hannah@marvell.com>, Robin Murphy <robin.murphy@arm.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
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

On Thu, 11 Jul 2019 17:02:41 +0200, Gregory CLEMENT wrote:
> From: Hanna Hawa <hannah@marvell.com>
> 
> Add specific compatible string for Marvell usage due errata of
> accessing 64bits registers of ARM SMMU, in AP806.
> 
> AP806 SoC uses the generic ARM-MMU500, and there's no specific
> implementation of Marvell, this compatible is used for errata only.
> 
> Signed-off-by: Hanna Hawa <hannah@marvell.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
