Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3440E4EAC91
	for <lists.iommu@lfdr.de>; Tue, 29 Mar 2022 13:46:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90AB7610DC;
	Tue, 29 Mar 2022 11:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QILvdZu6snFa; Tue, 29 Mar 2022 11:46:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 91EB1610E0;
	Tue, 29 Mar 2022 11:46:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4649FC0012;
	Tue, 29 Mar 2022 11:46:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE848C0012
 for <iommu@lists.linux-foundation.org>; Tue, 29 Mar 2022 11:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC78284246
 for <iommu@lists.linux-foundation.org>; Tue, 29 Mar 2022 11:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sTxkbnP3nROm for <iommu@lists.linux-foundation.org>;
 Tue, 29 Mar 2022 11:46:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::613])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BDF78421A
 for <iommu@lists.linux-foundation.org>; Tue, 29 Mar 2022 11:46:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4tRZXRUkhSN2EzrBpugYG2Dl7JBYxBCGCjSXJGgqAwYiDXEAQcUVmSd7GwCaq/7vgkePPTxt0fklK3EhDXc+8VPnr+ZgoPohuRdvhJpXtDoUAaQFLcT44pjsX4bb+o26kn31Nu3+gEE+Y+m4wTqwEIRCjlG13Dgb+fFVbyxG/QnnJ3LHugSxXBPvu+ANKGXM5QSrUPLrMaE1yu9b4G2WcJxB+SDFTYfcfVr+GVgDxld5vTS7OKkTGxOpAocnRRjcTaUiLY6jUnXhGXRcUd6AkQNElaAwEcpjr4pUemU8OeXHAUj350KBJ/jTT+t4CSoGi5vx2hgQXleS4LzZpcFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCIZur6AoaH7HAaHju88Yfwec9d3SLrUEIzdaITAeBU=;
 b=LznHenr483RJ0ISJ3KxJJumf8mPfOJA4ewe9oi0x8gBdN1SN11GDbYA/owP1kGSZLAkU7Fu9WRfPDQ3iWgzoC+vjtQ/XMQEEoqovI/2+pQu5UvnR3d3IxCPVOjNbrjNDfj3uBgFY3jVZYhaDWAZuyDvTiGZ3hmP4dDr4RbCwHBOKS/MN0Ua0/3cNU16qtyU7r8An/ECPzwsNfKDQafnpvg/WfLQ53ox+Nrbw54IvUy9IeeKGDG/BzTu2+SQr3KxV0/DpW4wfvEi4/mPrUJNmqwupbl6Ue/SE/yRbBnBqE1QgeKhhWiWkERcGhKnjS4PSURBz7pOryraI4VwbhHdqcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCIZur6AoaH7HAaHju88Yfwec9d3SLrUEIzdaITAeBU=;
 b=cAPc6wbyKiBuVxl8loaV86JMXKtQMVhGo0p40d+n4brKYsom1odvELMxIrv1vwZI67qjUcq9r7k0RPTu6FvYLxwkWjSsiDlroTRS+uVYp2E7fxLH7DcCHWCOrbqRlDd3QOlaW/l6OzzWri8Y18r4mSTfDshtSst64FsQ80p+B/dfzaX5ZTlVlPEK7D359ZC6akWwjK4Aj3fnkgf1IBxe1vMPQdaLm32VZeizk6IsFBtTxjsE8jOnRGKRbihYhya7euRB/tjrIy3FFyBTQZDQ4x5OhtzrRtGx3oJEmivf3IOXdxAVgiMcPohcVXSYcP9k4Ni1jiv0tNgCEuq2NSvagg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SN6PR12MB2704.namprd12.prod.outlook.com (2603:10b6:805:72::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Tue, 29 Mar
 2022 11:46:13 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::11a0:970a:4c24:c70c]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::11a0:970a:4c24:c70c%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 11:46:13 +0000
Date: Tue, 29 Mar 2022 08:46:11 -0300
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC 04/12] kernel/user: Allow user::locked_vm to be
 usable for iommufd
Message-ID: <20220329114611.GC1716663@nvidia.com>
References: <BN9PR11MB5276BED72D82280C0A4C6F0C8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEutpbOc_+5n3SDuNDyHn19jSH4ukSM9i0SUgWmXDydxnA@mail.gmail.com>
 <BN9PR11MB5276E3566D633CEE245004D08C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEvTmCFqAsc4z=2OXOdr7X--0BSDpH06kCiAP5MHBjaZtg@mail.gmail.com>
 <BN9PR11MB5276ECF1F1C7D0A80DA086D18C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtpWemw6tj=suxNjvSHuixyzhMJBYmqdbhQkinuWNADCQ@mail.gmail.com>
 <20220324114605.GX11336@nvidia.com>
 <CACGkMEtTVMuc-JebEbTrb3vRUVaNJ28FV_VyFRdRquVQN9VeQA@mail.gmail.com>
 <20220328122239.GL1342626@nvidia.com>
 <CACGkMEu_Zc+xBR0G9qNR6XQKNY9MLfTvbpgzpL2kNC4ri3DRQg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CACGkMEu_Zc+xBR0G9qNR6XQKNY9MLfTvbpgzpL2kNC4ri3DRQg@mail.gmail.com>
X-ClientProxiedBy: MN2PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:208:23b::27) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10f36012-7081-4276-68ef-08da1179b975
X-MS-TrafficTypeDiagnostic: SN6PR12MB2704:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB2704773DF81D472F6EB92517C21E9@SN6PR12MB2704.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nfcgw9jh0FcVLuKLWKg0h67yET7kKdgixgt3Yxfkbe/hEnnflBNC8rqTDWSHmfLfcy/McIW8AeGxj9vGbxzPF8UH5haIQcq4yLls6SD/zZslBpcS/Gf1SrBmFoiyc/4aBPpNx5UKk/Yq/y8YQu9bv5HykbnBL0geLYctDjQZv7aSRSf69vPOXtpyOqCTaRWi4R6uXRFnIZGFyQydo1GAHz08N+bGRsmAkTFNJwnyAdAW+kqdsN6abdCm/J+xfhIozokg3vhUqU6vr2V5F7lhecX64HL0CmZkgQosPcVqY2ZmXVUhWeA0ou6eRFDrMlRbtCL/g3MO50/RrB16xoiGptFR3vNEXikUha+W7+Ry074UuKdnAqQ9XJ2cueO+iE+plk7v6hQrs8oV0+zXygGn/AiTflWdpeBwbs9nCmifaWpJO5xuc3o0akLWmUAajZhUVqW0JrW0WwIN17hpllVgf63s8c8hZLRy/A+Z2w0e2qULhUJ52z8tUTPfg0Oh8vLWCm8U2q6I2WArQ+MtLj4Mxr/2k76hCLRoVoqEt36H5YngVwHrssq5UaimGpPchca7liqEpmuWNSqYkGzp4YIr6K1z0eN+q2JMO0841wlD/vAL+x9sE0Q87tofCkUyZsxA3P5S4083pu+OUDRrYAEtkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(86362001)(66476007)(66946007)(2906002)(8676002)(33656002)(4326008)(6506007)(7416002)(66556008)(4744005)(8936002)(26005)(316002)(54906003)(5660300002)(186003)(1076003)(36756003)(6916009)(38100700002)(2616005)(83380400001)(6486002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+8BmzVfWzBBPLG3BRsvhMJtbIYkplBRO60duLOxPQqWuPLOYB9CsAAB7C8Pc?=
 =?us-ascii?Q?O6cqGcrWP604dnvpdCk3l1McFpXqxZI0XMj/S82xjh3ePRIbJw1YrxKlCsOp?=
 =?us-ascii?Q?aI7UKucLarz5+RfJfWzhzHHhlcHgvw/EXAT5EUR5afOKHSz1s1FACCbZ/NTj?=
 =?us-ascii?Q?HtlfxFzXZ4/OiS9rBIrQxlqcuoKf3gUnlIaHL26IBximz4V8w5zf3Y6q7L7n?=
 =?us-ascii?Q?tMDb2w8p3g4683AAemqeBDjXaZNeHHtOTImzTz85mCDhU/K8NpC0k+UzmSMA?=
 =?us-ascii?Q?ukyLVwiLTN78B3ROy7DbGK7PX9J++IaD4mTRHybnpS1ksP/IgQxikTo0Wh4A?=
 =?us-ascii?Q?hHJWCQ2Y5hBhgvq7lqYDngD4i1g1pz37tgRYQVH1VRp77MaCkFh7CUsSFlo2?=
 =?us-ascii?Q?7Mc+2mEFvzt5iV7I+iyaxdcztANHHw1tvYBlDs+N1D0zWAVhrgE6Ymd+Zce4?=
 =?us-ascii?Q?WB3/aRkM0oOnsKQaOxk6znbGhhgt6U/unLF5Ke8qt/opI9VEIMzUf7oHjLY8?=
 =?us-ascii?Q?LXwpNZAXWTvPjB4NcGhb72TfNuYU1tPrPzgYOuUG7Vw9+EQriuzbh5QDCgFL?=
 =?us-ascii?Q?trGACCP4aGj4YaWq37NQOPXswkwuqYlE59Ws/8bLL1IKPmXptysaBdYerWrq?=
 =?us-ascii?Q?Zx4VVbo7oto59qVhVsQl64228Jl8Jg6sKak6jDm27xIQj+XlDrEdzro1CpoC?=
 =?us-ascii?Q?1PzCSGBP2k5BAhAJ04ruy7pixjTlOvqU3wJ1xGB7+/E0xaOqWfZ+n7T+wkIF?=
 =?us-ascii?Q?j75eS0OLKyXTZcs5LwfbjhLk4+A7U1iYbEzlAyyRRwv54nlv6jcp4ixUb2Ak?=
 =?us-ascii?Q?KXDyTJggkTUc49wgXJaMTVbG/9dWH37I2QStYAoYI/xbGkuXQv3Xw6dW2lKg?=
 =?us-ascii?Q?qG7NPvOGTC4I2a+iuDf9Iw0otoAiHwLlb6YvecUy0og6m6ILk0XZNB5ZuQD8?=
 =?us-ascii?Q?x3xCI9brREmWq7Dp9+0PkJm91fVZaYLTozfiDBz9HNKPWHu6Z5LSNoD9Xvak?=
 =?us-ascii?Q?zi6q72+rp06H7w/jmgOLe2moA+Q91IowqJ9tTbSL874Hrq0KLeSNulEqNn04?=
 =?us-ascii?Q?LHXre0QQvjVgqhOD4EZKBi1hVYldIgu/BdITGo8b0N/hshOG1UiXDaU2sOmE?=
 =?us-ascii?Q?Ui2FOUKHJV1L5qfq0ulJB2LVCgONCOIxb/igK91FiqxblmROjoHMlDk0KvzH?=
 =?us-ascii?Q?VFzszc9wQUn+3YxDT6QrFtro5hBw7xVyPOzR6sr8OYwOtH5Y3EPhagDDoxlN?=
 =?us-ascii?Q?8LcrIXBXVQw5azK5xGifqbEW5TWTCp4ZdG8vOFU6G+5FldeN2NfhSB2mugpV?=
 =?us-ascii?Q?CXcvK2Z19WtVTx6IdfoELHgpCVFfn7ybAmnJslqPc2eUjC9Kxgum2taMmLPz?=
 =?us-ascii?Q?1DbhvRIsDgf66Wx2TIH3m9Mv/8ffsMYhg3iT0VPPoRGDsr6N4j58klzjQQGG?=
 =?us-ascii?Q?AoHkrfI8jUOcn/mqMU2PkO4ke9XGTpMmGIdu5mzIpl7C0yGg2VhOvDsbUss7?=
 =?us-ascii?Q?PhhsdHgHjzsdNZxW61lZynFbsWo6a1Z/P9xmLP9/1kHNiCgdfbzLjy066Rxo?=
 =?us-ascii?Q?hUIoceU943OtSqVR+RbG6l05QhGbdKtNv6QqhGlVlbMSDBOg0ynXvGQVMISP?=
 =?us-ascii?Q?RT2zpNUuxXBpeVhu/WC7Ls5yQJ6HV2hgCnKImupVnDk5pIIiqzeNgbi908Z2?=
 =?us-ascii?Q?3k9nWS9ND/0npweShhDjlUL1C6Q3r9I6IE+i8D44TTUBK19JcThCWPpt8c85?=
 =?us-ascii?Q?WwsDLIhMKA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f36012-7081-4276-68ef-08da1179b975
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 11:46:12.8728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unPdhkDJKfFrPiHeVK1D0wkcpJFE4h0IpzW0oAaxo3yyYALdy1qrziMjYG+J+ULj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2704
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Martins,
 Joao" <joao.m.martins@oracle.com>, David Gibson <david@gibson.dropbear.id.au>,
 Sean Mooney <smooney@redhat.com>
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
From: Jason Gunthorpe via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Mar 29, 2022 at 12:59:52PM +0800, Jason Wang wrote:

> vDPA has a backend feature negotiation, then actually, userspace can
> tell vDPA to go with the new accounting approach. Not sure RDMA can do
> the same.

A security feature userspace can ask to turn off is not really a
security feature.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
